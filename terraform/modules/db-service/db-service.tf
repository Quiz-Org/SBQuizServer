################################################################################
# ECS Blueprint
################################################################################

module "ecs_service" {
  source  = "terraform-aws-modules/ecs/aws//modules/service"
  version = "~> 5.6"

  name               = var.container_name
  desired_count      = 3
  cluster_arn        = data.aws_ecs_cluster.core_infra.arn
  enable_autoscaling = false

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
    }
  }

  service_registries = {
    registry_arn = aws_service_discovery_service.this.arn
  }

  subnet_ids = data.aws_subnets.private.ids
  security_group_rules = {
    ingress_all_service = {
      type        = "ingress"
      from_port   = var.container_port
      to_port     = var.container_port
      protocol    = "tcp"
      description = "Service port"
      cidr_blocks = ["0.0.0.0/0"]
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

data "aws_subnets" "private" {
  depends_on = [var.vpc_id]
  filter {
    name   = "tag:Name"
    values = ["${var.cluster_name}-private-*"]
  }
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
