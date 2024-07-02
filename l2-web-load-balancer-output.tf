# LB public IP

output "web_lbpublicip" {
  description = "web lb publicip"
  value = azurerm_public_ip.web_lbpublicip.ip_address
}

# Load balancer ID

output  "web_lb_id"{
    description = "web Load Balancer ID"
    value = azurerm_lb.web_lb.id
}

# Load balancer frontend IP

output "web_lb_frontend_ip_configuration"{
    description = "web lb frontend ip configuration block"
    value = [azurerm_lb.web_lb.frontend_ip_configuration]
}
