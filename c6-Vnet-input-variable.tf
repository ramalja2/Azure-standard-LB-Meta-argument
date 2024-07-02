


# Virtula network name
variable "vnet_name" {
  description = "Virtual network name"
  type = string
  default = "vnet-default"
}

#Virtual network addess space
variable "vnet_address_space" {
    description = "Virtula network address space"
    type = list(string)
    default = [ "10.0.0.0/16" ]
}

# Web subnet name
variable "web_subnet_name" {
    description = "web subnet name"
    type = string
    default = "websubnet"
}

# Web subnet address space
variable "web_subnet_address" {
    description = "web subnet address space"
    type = list(string)
    default = [ "10.0.1.0/24" ] 
    }

# App subnet name
variable "app_subnet_name" {
    description = "app subnet name"
    type = string
    default = "appsubnet"
}

# App subnet address space
variable "app_subnet_address" {
    description = "app subnet address space"
    type = list(string)
    default = [ "10.0.11.0/24" ] 
    }

# Database subnet name
variable "db_subnet_name" {
    description = "db subnet name"
    type = string
    default = "dbsubnet"
}

# Database subnet address space
variable "db_subnet_address" {
    description = "db subnet address space"
    type = list(string)
    default = [ "10.0.21.0/24" ] 
    }

# Bastion subnet name
variable "bastion_subnet_name" {
    description = "Bastion subnet name"
    type = string
    default = "bastionsubnet"
}

# Bastion subnet address space
variable "bastion_subnet_address" {
    description = "Bastion subnet address space"
    type = list(string)
    default = [ "10.0.100.0/24" ] 
    }