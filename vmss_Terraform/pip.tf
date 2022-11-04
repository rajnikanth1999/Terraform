resource "azurerm_public_ip" "publicip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.ip_allocation_method
  sku = "Standard"
  depends_on = [
    azurerm_subnet_network_security_group_association.nsg-web
  ]
}