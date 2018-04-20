# standard (global) variables
variable "cluster_name" { default = "wdwitin" }  # from AID
variable "environment" { }            # in tfvars
variable "region" { }                 # in tfvars
variable "tf_vpc_state_region" { default = "us-east-1" }
variable "tf_vpc_state_bucket" { }    # in tfvars
variable "tf_vpc_state_key" { }       # in tfvars

# Default to NAP7 VEGAS-EXT VPN
variable "security_group_ingress_cidr" { default = ["172.16.0.0/12", "10.0.0.0/8", "192.168.0.0/16"] }

# ip range for public load balancer
variable "public_security_group_ingress_cidr" { default = ["68.71.223.4/32","139.104.184.236/32","192.195.66.0/24"] }

# DNS Zone Defaults to wdprapps.disney.com zone
variable "hosted_zone_id" { default = "/hostedzone/Z3VVQSNVCM9FMH" } #wdprapps id =Z3VVQSNVCM9FMH; wdpro id = "Z21AKRX1DNCSB3" }

# accounting
variable "bapp_id" { default = "BAPP0088463" }         # From Cloud Assessment
variable "ownerorg" { default = "wdw" }    # always "wdpr" for Parks & Resorts
variable "executiveowner" { default = "" }  # From ServiceNOW
variable "system_engineering_contact" { default = "se@disney.com" }

variable "node_name_id" { default = "1470" }    # see https://wdpr-se-cloud.pages.gitlab.disney.com/wiki/se/infrastructure/taxonomies.html

variable "bag" { default = "sales2" } # From cloud assessment

# ELB
variable "elb_enable_connection_draining" { default = true }
variable "elb_health_check_interval" { default = 30 }
variable "elb_enable_crosszone" { default = true }
variable "elb_unhealthy_threshold" { default = 5 }
variable "elb_health_check_timeout" { default = 29 }
variable "memory_up_threshold_facade" { default = "70" }
variable "memory_down_threshold_facade" { default = "55" }
variable "elb_healthy_threshold" { default = 2 }

# Autoscaling
variable "autoscale_min_size" {}
variable "autoscale_max_size" {}

# ECS
variable "service_ecs_instance_type" {}
variable "ebs_docker_disk" { default = "/dev/xvdcz" }
variable "ebs_docker_mnt" { default = "/var/lib/docker/" }

# AppDynamics
variable "appd_controller_host_name" {  default = "disney-preprod.saas.appdynamics.com" }
variable "appd_controller_port" { default = "443" }
variable "appd_controller_ssl_enabled" { default = "true" }
variable "appd_account_name" { default = "Disney-PreProd" }
variable "appd_account_access_key" { default = "ca80841c29c2" }
variable "appd_tier_prefix" { default = "core" } # core or digital

# Monitoring
variable "api_metrics" { default = "HTTPCode_ELB_4XX" }

variable "s3_users_bucket" {
  description = "Name of the bucket from which users are added automatically"
  default = "wdpr-apps-seusers"
}

variable "s3_users_groups" {
  description = "Comma separated list of groups to which the users from s3 should be added"
  default = "wheel"
}

variable "log_retention" {
  description = "Number of days to keep logs in the default cloudwatch log group for the cluster"
  default = "90"
}

variable "log_filter_pattern" {
  default = ""
  description = "Use blank to send all logs streams in log group to Kinesis"
}

variable "kinesis_stream_arn" {
  default = ""
  description = "Provide kinesis stream arn if already created in latest/prod manually, it will not create new Kinesis stream and update kinesis_override to 1"
}

variable "kinesis_override" {
  default = "0"
  description = "Update this value to 1 if a value is provided in kinesis_stream_arn variable"
}

variable "s3_heap_dump_bucket" {
  default = "wdpr-apps-perf"
}

