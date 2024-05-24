resource "aws_vpc" "quiz_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "subnet_a" {
  vpc_id = aws_vpc.quiz_vpc.id
  availability_zone = var.availability_zones[0]
  cidr_block = cidrsubnet(aws_vpc.quiz_vpc.cidr_block, 8, 0)
}

resource "aws_subnet" "subnet_b" {
  vpc_id = aws_vpc.quiz_vpc.id
  availability_zone = var.availability_zones[1]
  cidr_block = cidrsubnet(aws_vpc.quiz_vpc.cidr_block, 8, 1)
}

resource "aws_subnet" "subnet_c" {
  vpc_id = aws_vpc.quiz_vpc.id
  availability_zone = var.availability_zones[2]
  map_public_ip_on_launch = true
  cidr_block = cidrsubnet(aws_vpc.quiz_vpc.cidr_block, 8, 3)
}

resource "aws_nat_gateway" "subnet_c_nat" {
  subnet_id = aws_subnet.subnet_c.id
  allocation_id = aws_eip.eip.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.quiz_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.quiz_gateway.id
  }
  tags = {
    Name = "Public Subnet Route Table"
  }
}

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_internet_gateway" "quiz_gateway" {
  vpc_id = aws_vpc.quiz_vpc.id
}

resource "aws_route_table_association" "rt_associate_public" {
  subnet_id = aws_subnet.subnet_c.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_default_subnet" "default_subnet_a" {
  availability_zone = var.availability_zones[0]
}

resource "aws_default_subnet" "default_subnet_b" {
  availability_zone = var.availability_zones[1]
}

resource "aws_default_subnet" "default_subnet_c" {
  availability_zone = var.availability_zones[2]
}

resource "aws_service_discovery_private_dns_namespace" "quiz_namespace" {
  name = "quiz.local"
  vpc  = aws_vpc.quiz_vpc.id
}

resource "aws_security_group" "load_balancer_security_group" {
  vpc_id = aws_vpc.quiz_vpc.id
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "service_security_group" {
  vpc_id = aws_vpc.quiz_vpc.id
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["${aws_security_group.load_balancer_security_group.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "quiz_load_balancer" {
  name = "quiz-load-balancer"
  enable_cross_zone_load_balancing = true
  load_balancer_type = "application"
  security_groups = [aws_security_group.load_balancer_security_group.id]
  subnets = [
    "${aws_subnet.subnet_a.id}",
    "${aws_subnet.subnet_b.id}",
    "${aws_subnet.subnet_c.id}"
  ]
}

resource "aws_lb_listener" "sb_server_listener" {
  load_balancer_arn = aws_lb.quiz_load_balancer.arn
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.sb_server_target_group.arn
  }
  port = 8080
  protocol = "HTTP"
}

resource "aws_lb_target_group" "sb_server_target_group" {
  name = "sb-server-tg"
  target_type = "ip"
  port = 8080
  protocol = "HTTP"
  vpc_id = aws_vpc.quiz_vpc.id
}

resource "aws_cloudwatch_log_group" "quiz_log_group" {
  name = "quiz-log-group"
}

resource "aws_ecs_cluster" "quiz-cluster" {
  name = "quiz-cluster"
  tags = {
    "key" : "Project",
    "value" : "quiz-server"
  }
}

resource "aws_ecs_service" "db_service" {
  name                               = "db-service"
  cluster                            = aws_ecs_cluster.quiz-cluster.arn
  task_definition = aws_ecs_task_definition.db_task_definition.arn
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count = 1
  launch_type = "FARGATE"
  deployment_controller { type = "ECS" }
  network_configuration {
    security_groups = ["${aws_security_group.service_security_group.id}"]
    subnets = [
      "${aws_subnet.subnet_a.id}",
      "${aws_subnet.subnet_b.id}",
      "${aws_subnet.subnet_c.id}"
    ]
  }
  propagate_tags = "SERVICE"
  scheduling_strategy = "REPLICA"
  service_registries {
    registry_arn = aws_service_discovery_service.db_service_discovery_entry.arn
  }
}

resource "aws_service_discovery_service" "db_service_discovery_entry" {
  name = "db"
  description = "db service discovery entry"
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.quiz_namespace.id
    routing_policy = "MULTIVALUE"
    dns_records {
      ttl  = 60
      type = "A"
    }
  }
  health_check_custom_config {failure_threshold = 1}
  namespace_id = aws_service_discovery_private_dns_namespace.quiz_namespace.id
}

resource "aws_ecs_task_definition" "db_task_definition" {
  family                = "db-task-task-definition"
  cpu = "256"
  memory = "512"
  task_role_arn = aws_iam_role.db_task_role.arn
  execution_role_arn = aws_iam_role.db_task_role.arn
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions = <<TASK_DEFINITION
[
    {
      "Name": "Db_ResolvConf_InitContainer",
      "Image": "docker/ecs-searchdomain-sidecar:1.0",
      "command": [
                "eu-west-2.compute.internal",
                "quiz.local"
      ],
      "essential": false,
      "logConfiguration":
      {
        "logDriver": "awslogs",
        "options":
        {
          "awslogs-group": "quiz-log-group",
          "awslogs-region": "eu-west-2",
          "awslogs-stream-prefix": "db-init"
        },
        "secretOptions": []
      }
    },
    {
      "Name": "db",
      "DependsOn": [
        {
          "Condition": "SUCCESS",
          "ContainerName": "Db_ResolvConf_InitContainer"
        }
      ],
      "Essential": true,
      "Image": "docker.io/fegrus/quiz-db:latest@sha256:677f25fe96216d99c9aec331fab5780ae49c03b0726cdb2cb6596a8b86bc022e",
      "LinuxParameters": {},
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "quiz-log-group",
          "awslogs-region": "eu-west-2",
          "awslogs-stream-prefix": "db"
        },
        "secretOptions": []
      }
    }
  ]
  TASK_DEFINITION
}

resource "aws_iam_role" "db_task_role" {
  assume_role_policy = data.aws_iam_policy_document.task_execution_role.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]
}

resource "aws_ecs_service" "sb_server_service" {
  name = "sb-server-service"
  task_definition = aws_ecs_task_definition.sb_server_task_definition.arn
  depends_on = [aws_ecs_service.db_service,aws_lb_listener.sb_server_listener]
  cluster = aws_ecs_cluster.quiz-cluster.arn
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  deployment_controller { type = "ECS" }
  network_configuration {
    security_groups = ["${aws_security_group.service_security_group.id}"]
    subnets = [
      "${aws_subnet.subnet_a.id}",
      "${aws_subnet.subnet_b.id}",
      "${aws_subnet.subnet_c.id}"
    ]
  }
  platform_version = "1.4.0"
  propagate_tags = "SERVICE"
  scheduling_strategy = "REPLICA"
  desired_count = 1
  launch_type = "FARGATE"
  load_balancer {
    container_name = "sb-server"
    container_port = 8080
    target_group_arn = aws_lb_target_group.sb_server_target_group.arn
  }
  service_registries {
    registry_arn = aws_service_discovery_service.db_service_discovery_entry.arn
  }
}

resource "aws_service_discovery_service" "sb_server_service_discovery_entry" {
  name = "sb-server"
  description = "sb-server service discovery entry"
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.quiz_namespace.id
    routing_policy = "MULTIVALUE"
    dns_records {
      ttl  = 60
      type = "A"
    }
  }
  health_check_custom_config {failure_threshold = 1}
  namespace_id = aws_service_discovery_private_dns_namespace.quiz_namespace.id
}

resource "aws_ecs_task_definition" "sb_server_task_definition" {
  family                = "sb-server-task-definition"
  cpu = "256"
  memory = "512"
  task_role_arn = aws_iam_role.sb_server_task_role.arn
  execution_role_arn = aws_iam_role.sb_server_task_role.arn
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions = <<TASK_DEFINITION
[
    {
      "Command": [
        "eu-west-2.compute.internal",
        "sbquizserver.local"
      ],
      "Image": "docker/ecs-searchdomain-sidecar:1.0",
      "Essential": false,
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "quiz-log-group",
          "awslogs-region": "eu-west-2",
          "awslogs-stream-prefix": "sb-server-init"
        },
        "secretOptions": []
      },
      "Name": "Sbserver_ResolvConf_InitContainer"
    },
    {
      "DependsOn": [
        {
          "Condition": "SUCCESS",
          "ContainerName": "Sbserver_ResolvConf_InitContainer"
        }
      ],
      "Essential": true,
      "Image": "fegrus/quiz-sb-server:latest",
      "LinuxParameters": {},
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "quiz-log-group",
          "awslogs-region": "eu-west-2",
          "awslogs-stream-prefix": "sb-server"
        },
        "secretOptions": []
      },
      "Name": "sb-server",
      "PortMappings": [
        {
          "ContainerPort": 8080,
          "HostPort": 8080,
          "Protocol": "tcp"
        }
      ]
    }
  ]
  TASK_DEFINITION
}

resource "aws_iam_role" "sb_server_task_role" {
  assume_role_policy = data.aws_iam_policy_document.task_execution_role.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]
}