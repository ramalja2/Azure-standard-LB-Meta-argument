# Virtual network output

#virtual network name
output "virtual_network_name" {
  description = "Virtual Network name"
  value = azurerm_virtual_network.vnet.name
}

# virtaul network ID
output "virtual_network_id" {
    description = "virtaul network ID"
    value = azurerm_virtual_network.vnet.id
}

# web subnet name
output "web_subnet_name" {
  description = "Webtier subnet name"
  value = azurerm_subnet.websubnet.name
}

# web subnet  ID
output "web_subnet_id" {
    description = "web subnet name id"
    value = azurerm_subnet.websubnet.id
}

# app subnet name
output "app_subnet_name" {
  description = "apptier subnet name"
  value = azurerm_subnet.appsubnet.name
}

# app subnet  ID
output "app_subnet_id" {
    description = "app subnet name id"
    value = azurerm_subnet.appsubnet.id
}

# bastion subnet name
output "bastion_subnet_name" {
  description = "bastiontier subnet name"
  value = azurerm_subnet.bastionsubnet.name
}

# bastion subnet  ID
output "bastion_subnet_id" {
    description = "bastion subnet name id"
    value = azurerm_subnet.bastionsubnet.id
}

# db subnet name
output "db_subnet_name" {
  description = "dbtier subnet name"
  value = azurerm_subnet.dbsubnet.name
}

# db subnet  ID
output "db_subnet_id" {
    description = "db subnet name id"
    value = azurerm_subnet.dbsubnet.id
}

# Network security output

# Web subnet NSG name
output "web_subnet_nsg_name" {
  description = "Web subnet NSG name"
  value = azurerm_network_security_group.web_subnet_nsg.name
}

# Web subnet NSG ID
output "web_subnet_nsg_id" {
    description = "web subnet NSG id"
    value = azurerm_network_security_group.web_subnet_nsg.id
}

# app subnet NSG name
output "app_subnet_nsg_name" {
  description = "app subnet NSG name"
  value = azurerm_network_security_group.app_subnet_nsg.name
}

# app subnet NSG ID
output "app_subnet_nsg_id" {
    description = "app subnet NSG id"
    value = azurerm_network_security_group.app_subnet_nsg.id
}

# bastion subnet NSG name
output "bastion_subnet_nsg_name" {
  description = "bastion subnet NSG name"
  value = azurerm_network_security_group.bastion_subnet_nsg.name
}

# bastion subnet NSG ID
output "bastion_subnet_nsg_id" {
    description = "bastion subnet NSG id"
    value = azurerm_network_security_group.bastion_subnet_nsg.id
}

# db subnet NSG name
output "db_subnet_nsg_name" {
  description = "db subnet NSG name"
  value = azurerm_network_security_group.db_subnet_nsg.name
}

# db subnet NSG ID
output "db_subnet_nsg_id" {
    description = "db subnet NSG id"
    value = azurerm_network_security_group.db_subnet_nsg.id
}
