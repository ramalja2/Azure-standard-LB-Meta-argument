# create public IP

resource "azurerm_public_ip" "bastion-host-public-ip" {
  name = "${local.resource_name_prefix}-bastion-host-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Static"
  sku = "Standard"
}

# create network interface

resource "azurerm_network_interface" "bastion_host_linuxvm_nic" {
    name = "${local.resource_name_prefix}-bastion-host-linuxvm-nic"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
  
  ip_configuration {
    name = "bastion-host-ip-1"
    subnet_id = azurerm_subnet.bastionsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.bastion-host-public-ip.id
  }
}

# Create bastion host VM

resource "azurerm_linux_virtual_machine" "bastion_host_linuxvm" {
    name = "${local.resource_name_prefix}-bastion-host-linuxvm"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
     size = "Standard_DS1_v2"
  admin_username = "azureuser"
  network_interface_ids = [azurerm_network_interface.bastion_host_linuxvm_nic.id]

  admin_ssh_key {
    username = "azureuser"
    #public_key = file("${path.module}/ssh-keys/public_Key")
    public_key = tls_private_key.linux_test_ssh.public_key_openssh
  } 
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }  
    os_disk {
    caching = "ReadWrite" 
    storage_account_type = "Standard_LRS"
  } 
  #custom_data = filebase64("${path.module}/app-scripts/redhat-webvm-script.sh")
  custom_data = base64encode(local.webvm_custom_data)
}
