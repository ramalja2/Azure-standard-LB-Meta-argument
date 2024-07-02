# Generic Input variables
# Business variables
variable "business_division" {
  description = "Business division in large org"
  type = string
  default = "sap"
}
# Environment variables
variable "Environment" {
  description = "Environment variable used as a prefix"
  type = string
  default = "dev"
}
# Azure resource group name
variable "resource_group_name" {
  description = "Resource group name"
  type = string
  default = "rg-default"
}
# Azure resource location
variable "resource_group_location" {
  description = "Resource group location"
  type = string
  default = "eastus2"
}