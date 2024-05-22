resource "aws_ecs_cluster" "quiz_cluster" {
  name = var.quiz_cluster_name
}

resource "aws_default_vpc" "default_vpc" {}

resource "aws_default_subnet" "default_subnet_a" {
  availability_zone = var.availability_zones[0]
}
resource "aws_default_subnet" "default_subnet_b" {
  availability_zone = var.availability_zones[1]
}
resource "aws_default_subnet" "default_subnet_c" {
  availability_zone = var.availability_zones[2]
}
resource "aws_ecs_task_definition" "quiz_task" {
  family                   = "quiz"
  container_definitions    = <<DEFINITION
  [
        {
            "name": "db",
            "image": "${var.ecr_repo_url}:db",
            "cpu": 0,
            "links": [],
            "portMappings": [{
              "name": "dbport",
              "containerPort": 3306,
              "hostPort": 3306,
              "protocol": "tcp"
            }],
            "essential": true,
            "entryPoint": [],
            "command": [],
            "environment": [],
            "environmentFiles": [],
            "mountPoints": [],
            "volumesFrom": [],
            "linuxParameters": {
                "devices": [],
                "tmpfs": []
            },
            "secrets": [],
            "dependsOn": [
                {
                    "containerName": "Db_ResolvConf_InitContainer",
                    "condition": "SUCCESS"
                }
            ],
            "dnsServers": [],
            "dnsSearchDomains": [],
            "extraHosts": [],
            "dockerSecurityOptions": [],
            "dockerLabels": {},
            "ulimits": [],
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-group": "quiz-logs",
                    "awslogs-region": "eu-west-2",
                    "awslogs-stream-prefix": "dbquiz"
                },
                "secretOptions": []
            },
            "systemControls": [],
            "credentialSpecs": []
        },
        {
            "name": "Db_ResolvConf_InitContainer",
            "image": "docker/ecs-searchdomain-sidecar:1.0",
            "cpu": 0,
            "links": [],
            "portMappings": [],
            "essential": false,
            "entryPoint": [],
            "command": [
                "eu-west-2.compute.internal",
                "sbquizserver.local"
            ],
            "environment": [],
            "environmentFiles": [],
            "mountPoints": [],
            "volumesFrom": [],
            "secrets": [],
            "dnsServers": [],
            "dnsSearchDomains": [],
            "extraHosts": [],
            "dockerSecurityOptions": [],
            "dockerLabels": {},
            "ulimits": [],
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-group": "quiz-logs",
                    "awslogs-region": "eu-west-2",
                    "awslogs-stream-prefix": "dbquizinit"
                },
                "secretOptions": []
            },
            "systemControls": [],
            "credentialSpecs": []
        },
{
            "name": "sb-server",
            "image": "${var.ecr_repo_url}:quiz-sb-server",
            "cpu": 0,
            "links": [],
            "portMappings": [
                {
                    "name": "sb-port",
                    "containerPort": 8080,
                    "hostPort": 8080,
                    "protocol": "tcp"
                }
            ],
            "essential": true,
            "entryPoint": [],
            "command": [],
            "environment": [],
            "environmentFiles": [],
            "mountPoints": [],
            "volumesFrom": [],
            "linuxParameters": {
                "devices": [],
                "tmpfs": []
            },
            "secrets": [],
            "dependsOn": [
                {
                    "containerName": "Sbserver_ResolvConf_InitContainer",
                    "condition": "SUCCESS"
                }
            ],
            "dnsServers": [],
            "dnsSearchDomains": [],
            "extraHosts": [],
            "dockerSecurityOptions": [],
            "dockerLabels": {},
            "ulimits": [],
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-group": "quiz-logs",
                    "awslogs-region": "eu-west-2",
                    "awslogs-stream-prefix": "sbquizserver"
                },
                "secretOptions": []
            },
            "systemControls": [],
            "credentialSpecs": []
        },
        {
            "name": "Sbserver_ResolvConf_InitContainer",
            "image": "docker/ecs-searchdomain-sidecar:1.0",
            "cpu": 0,
            "links": [],
            "portMappings": [],
            "essential": false,
            "entryPoint": [],
            "command": [
                "eu-west-2.compute.internal",
                "sbquizserver.local"
            ],
            "environment": [],
            "environmentFiles": [],
            "mountPoints": [],
            "volumesFrom": [],
            "secrets": [],
            "dnsServers": [],
            "dnsSearchDomains": [],
            "extraHosts": [],
            "dockerSecurityOptions": [],
            "dockerLabels": {},
            "ulimits": [],
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-group": "quiz-logs",
                    "awslogs-region": "eu-west-2",
                    "awslogs-stream-prefix": "sbquizserver"
                },
                "secretOptions": []
            },
            "systemControls": [],
            "credentialSpecs": []
        }
    ]
  DEFINITION
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = "512"
  cpu                      = "256"
  execution_role_arn       = aws_iam_role.quiz_task_execution_role.arn
}
resource "aws_cloudwatch_log_group" "log_group" {
  name = "quiz-logs"

  tags = {
    Environment = "production"
    Application = "quiz"
  }
}

resource "aws_iam_role" "quiz_task_execution_role" {
  name               = var.ecs_task_execution_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.quiz_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_alb" "application_load_balancer" {
  name               = var.application_load_balancer_name
  load_balancer_type = "application"
  subnets = [
    "${aws_default_subnet.default_subnet_a.id}",
    "${aws_default_subnet.default_subnet_b.id}",
    "${aws_default_subnet.default_subnet_c.id}"
  ]
  security_groups = ["${aws_security_group.load_balancer_security_group.id}"]
}

resource "aws_security_group" "load_balancer_security_group" {
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
resource "aws_lb_target_group" "target_group" {
  name        = var.target_group_name
  port        = var.container_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_default_vpc.default_vpc.id
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  port              = "8080"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
resource "aws_ecs_service" "quiz_service" {
  name            = var.quiz_db_service_name
  cluster         = aws_ecs_cluster.quiz_cluster.id
  task_definition = aws_ecs_task_definition.quiz_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  force_new_deployment = true

  triggers = {
    redeployment = plantimestamp()
  }

  network_configuration {
    subnets          = ["${aws_default_subnet.default_subnet_a.id}", "${aws_default_subnet.default_subnet_b.id}", "${aws_default_subnet.default_subnet_c.id}"]
    assign_public_ip = true
    security_groups  = ["${aws_security_group.service_security_group.id}"]
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn
    container_name   = "sb-server"
    container_port   = var.container_port
  }
}

resource "aws_security_group" "service_security_group" {
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

