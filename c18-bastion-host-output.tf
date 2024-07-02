## Public IP Address
/*
output "bastion_host_public_ip" {
  description = "bastion host VM Public Address"
  value = azurerm_public_ip.bastion-host-public-ip.ip_address
}
*/


# Network Interface Outputs
## Network Interface ID
output "bastion_host_network_interface_id" {
  description = "bastion host VM Network Interface ID"
  value = azurerm_network_interface.web_linuxvm_nic[*].id
}
## Network Interface Private IP Addresses
output "bastion_host_network_interface_private_ip_addresses" {
  description = "bastion host VM Private IP Addresses"
  value = [azurerm_network_interface.bastion_host_linuxvm_nic[*].private_ip_addresses]
}

# Linux VM Outputs

## Virtual Machine Public IP
/*
output "bastion_host_linuxvm_public_ip_address" {
  description = "bastion host Virtual Machine Public IP"
  value = azurerm_linux_virtual_machine.bastion_host_linuxvm.public_ip_address
}
*/




