# linux VM instance count
variable "web_linuxvm_instance_count" {
  description = "Web linux VM instance count"
  type = number
  default = 1
}

# web LB inbount NAT port for all VMs

variable "lb_inbound_nat_ports" {
  description = "web LB Inbound NAT ports List"
  type = list(string)
  default = ["1022", "2022", "3022", "4022", "5022"]
}