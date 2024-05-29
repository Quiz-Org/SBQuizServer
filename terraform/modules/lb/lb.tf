
################################################################################
# Application Load Balancer
################################################################################


module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"

  name = var.cluster_name

  # For example only
  enable_deletion_protection = false

  vpc_id  = data.aws_vpc.vpc.id
  subnets = data.aws_subnets.public.ids
  security_group_ingress_rules = {
    all_http = {
      from_port   = 8080
      to_port     = 8080
      ip_protocol = "tcp"
      description = "HTTP Spring traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
  security_group_egress_rules = {
    for subnet in data.aws_subnet.private_cidr :
    (subnet.availability_zone) => {
      ip_protocol = "-1"
      cidr_ipv4   = subnet.cidr_block
    }
  }


  listeners = {
    http = {
      port     = var.listener_port
      protocol = "HTTP"

      forward = {
        target_group_key = "ecs-task"
      }
    }
  }

  target_groups = {
    ecs-task = {
      backend_protocol = "HTTP"
      backend_port     = var.container_port
      target_type      = "ip"

      health_check = {
        enabled             = true
        healthy_threshold   = 5
        interval            = 30
        matcher             = "200-499"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = 5
        unhealthy_threshold = 2
      }

      # There's nothing to attach here in this definition. Instead,
      # ECS will attach the IPs of the tasks to this target group
      create_attachment = false
    }
  }

  route53_records = {
    A = {
      name    = var.cluster_name
      type    = "A"
      zone_id = data.aws_route53_zone.route_53_zone.id
    }
  }
  tags = var.tags
}

data "aws_route53_zone" "route_53_zone" {
  name = "myquizapp.co.uk"
}

data "aws_vpc" "vpc" {
  depends_on = [var.vpc_id]
  filter {
    name   = "tag:Name"
    values = ["quiz-server"]
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


