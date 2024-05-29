################################################################################
# ECS Blueprint
################################################################################

module "ecs_service" {
  source  = "terraform-aws-modules/ecs/aws//modules/service"
  version = "~> 5.6"

  name          = var.container_name
  desired_count = 3
  cluster_arn   = data.aws_ecs_cluster.core_infra.arn

  # Task Definition
  enable_execute_command = true

  container_definitions = {
    (var.container_name) = {
      image                    = "${var.container_registry}${var.container_name}"
      readonly_root_filesystem = false

      port_mappings = [
        {
          protocol      = "tcp",
          containerPort = var.container_port
        }
      ]

      environment = [
        {
          name  = "DB_URL",
          value = "${var.db_name}.${var.namespace_name}:${var.db_port}"
        }
      ]

    }
  }

  service_registries = {
    registry_arn = aws_service_discovery_service.this.arn
  }

  load_balancer = {
    service = {
      target_group_arn = var.lb_target_group_arn
      container_name   = var.container_name
      container_port   = var.container_port
    }
  }

  subnet_ids = data.aws_subnets.private.ids
  security_group_rules = {
    ingress_alb_service = {
      type                     = "ingress"
      from_port                = var.container_port
      to_port                  = var.container_port
      protocol                 = "tcp"
      description              = "Service port"
      source_security_group_id = var.lb_security_group_id
    }
    egress_all = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = var.tags
}

resource "aws_service_discovery_service" "this" {
  name = var.container_name

  dns_config {
    namespace_id = data.aws_service_discovery_dns_namespace.this.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}

################################################################################
# Supporting Resources
################################################################################

data "aws_vpc" "vpc" {
  depends_on = [var.vpc_id]
  filter {
    name   = "tag:Name"
    values = ["${var.cluster_name}"]
  }
}

data "aws_subnets" "public" {
  depends_on = [var.vpc_id]
  filter {
    name   = "tag:Name"
    values = ["${var.cluster_name}-public-*"]
  }
}

data "aws_subnets" "private" {
  depends_on = [var.vpc_id]
  filter {
    name   = "tag:Name"
    values = ["${var.cluster_name}-private-*"]
  }
}

data "aws_subnet" "private_cidr" {
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
}

data "aws_ecs_cluster" "core_infra" {
  depends_on   = [var.cluster_name]
  cluster_name = var.cluster_name
}

data "aws_service_discovery_dns_namespace" "this" {
  depends_on = [var.namespace_name]
  name       = var.namespace_name
  type       = "DNS_PRIVATE"
}
