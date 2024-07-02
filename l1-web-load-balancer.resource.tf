# Create public IP for LB
resource "azurerm_public_ip" "web_lbpublicip" {
    name = "${local.resource_name_prefix}-weblbpublicip"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    allocation_method = "Static"
    sku = "Standard"
    tags = local.common_tags
}

# create azure standard load balancer
resource "azurerm_lb" "web_lb" {
    name = "${local.resource_name_prefix}-web-lb"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    sku = "Standard"
    frontend_ip_configuration {
      name = "web-lb-public-ip-1"
      public_ip_address_id = azurerm_public_ip.web_lbpublicip.id
    }
}

# Create LB backend pool

resource "azurerm_lb_backend_address_pool" "web_lb_backend_address_pool" {
  name = "web-backend"
  loadbalancer_id = azurerm_lb.web_lb.id
}

# Create health probe

resource "azurerm_lb_probe" "web_lb_probe" {
  name = "tcp-probe"
  protocol = "Tcp"
  port = 80
  loadbalancer_id = azurerm_lb.web_lb.id
}

# Create LB rule

resource "azurerm_lb_rule" "web_lb_rule_app1" {
  name = "web-app1-rule"
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  probe_id = azurerm_lb_probe.web_lb_probe.id
  loadbalancer_id = azurerm_lb.web_lb.id
}

# assocaite network interface and LB associate

resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associate" {
    count = var.web_linuxvm_instance_count
    network_interface_id = element(azurerm_network_interface.web_linuxvm_nic[*].id, count.index)
    ip_configuration_name = azurerm_network_interface.web_linuxvm_nic[count.index].ip_configuration[0].name
    backend_address_pool_id = azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id
}