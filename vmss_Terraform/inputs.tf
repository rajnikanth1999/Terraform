variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "Packer"
}
variable "location" {
  type        = string
  description = "Location for all resources"
  default     = "east us"
}
variable "Vnet_name" {
  type        = string
  description = "Virtual Network Name"
  default     = "N-Tier"
}
variable "Vnet_cidr" {
  type        = string
  description = "Virtual Network cidr range"
  default     = "192.168.0.0/16"
}
variable "subnet_names" {
  type        = list(string)
  description = "Subnets Names"
  default     = ["app", "web", "db"]
}
variable "nsg_name" {
  type        = string
  description = "For Network security group name"
  default     = "N-Tier-NSG"
}
variable "nic_name" {
  type        = string
  description = "For Nic name"
  default     = "N-Tier_Nic"
}
variable "public_ip_name" {
  type        = string
  description = "For public name"
  default     = "web"
}
variable "ip_allocation_method" {
  type = string
  description = "For ip address allocation method"
  default = "Static"
}
variable "security_rules" {
  type = list(object(
     {
      name                       = string,
      priority                   = string
      direction                  = string,
      access                     = string,
      protocol                   = string,
      source_port_range          = string,
      source_address_prefix      = string,
      destination_port_range     = string,
      destination_address_prefix = string
  }
  ))
  description = "for security group rules"
  default = [
    {
    name                       = "HTTP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "80"
    destination_address_prefix = "*"
    },
    {
      name                       = "HTTPS"
      priority                   = 310
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "8080"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "SSH"
      priority                   = 320
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}
# Load Balancer variables
variable "lb_name" {
  type = string
  description = "For Load balance name"
  default = "packerlb"
}
variable "lb_fip_name" {
  type = string
  description = "For Load balancer frentend ip configuration"
  default = "lb_fip"
}
# For load balancerrules
variable "rule_name" {
  type = list(object({
    name = string
    protocol = string
    frontend_port = string
  backend_port = string
  }))
  description = "(optional) describe your variable"
  default = [ {
    backend_port = "80"
    frontend_port = "80"
    name = "Apache2"
    protocol = "Tcp"
  } ]
}
variable "bep_Name" {
  type = string
  description = "For backend pool Name"
  default = "BEP"
}
# For Compute image
variable "image_rg_name" {
  type = string
  description = "For Image Resource Group"
  default = "packer1"
}
variable "gallery_name" {
  type = string
  description = "For Gallery image name"
  default = "packer1"
}
variable "image_name" {
  type = string
  description = "For image Name"
  default = "packer1"
}
# VMSS Variables
variable "vmss_name" {
  type        = string
  description = "For virtual machine name"
  default     = "packer"
}
variable "publisher" {
  type = string
  description = "For VMSS Publisher"
  default = "Rajnikanth"
} 
variable "offer" {
  type = string
  description = "For vmss offer"
  default = "Apache2"
}
variable "vmss_version" {
  type = string
  description = "For VMSS Version"
  default = "1.0.0"
}
variable "sku" {
  type = string
  description = "For VMSS SKU"
  default = "packer1"
}
variable "vmss_size" {
  type = string
  description = "For vmss size"
  default = "Standard_B1s"
}
variable "vmss_count" {
  type = string
  description = "Give No of instances to be created"
  default = "2"
}
variable "vmss_user_name" {
  type = string
  description = "(optional) describe your variable"
  default = "packer"  
}
variable "vmss_password" {
  type = string
  description = "For VMSS Password"
  default = "Password@1234"
}
variable "vmss_ipconfig" {
  type = string
  description = "For vmss ip config"
  default = "vmssipconfig"
}