#Azure resource group

resource "azurerm_resource_group" "rg" {
  #name = "${local.resource_name_prefix}-${var.resource_group_name}"
  name = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.myrandom.id}"
  location = var.resource_group_location
  tags = local.common_tags
}


# Create (and display) an SSH key

resource "tls_private_key" "linux_test_ssh" {

  algorithm = "RSA"

  rsa_bits  = 4096

}
