# Define local values in terraform
locals {
  owners = var.business_division
  environment = var.Environment
  resource_name_prefix = "${var.business_division}-${var.Environment}"
  common_tags = {
    owners = local.owners,
    environment = local.environment
  }
}
