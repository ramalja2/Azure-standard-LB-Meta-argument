# Create db tier subnet resource
resource "azurerm_subnet" "dbsubnet" {
  name = "${local.resource_name_prefix}-${var.db_subnet_name}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.db_subnet_address
}

# create  network security group
resource "azurerm_network_security_group" "db_subnet_nsg" {
  name = "${azurerm_subnet.dbsubnet.name}-nsg"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Associate NSG with subnet
resource "azurerm_subnet_network_security_group_association" "db_subnet_nsg_association" {
    depends_on = [ azurerm_network_security_rule.db_nsg_rule_inbound ]
  subnet_id = azurerm_subnet.dbsubnet.id
  network_security_group_id = azurerm_network_security_group.db_subnet_nsg.id
}

# Local block for security group
locals {
    db_inbound_ports_map = {
        "100" : "3306",
        "110" : "1433",
        "120" : "5432"
    }
}

# create NSG
resource "azurerm_network_security_rule" "db_nsg_rule_inbound" {
    for_each = local.db_inbound_ports_map
  name                        = "Rule-port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.db_subnet_nsg.name
}

