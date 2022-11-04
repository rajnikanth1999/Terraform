resource "azurerm_network_security_group" "webnsg" {
  resource_group_name = var.resource_group_name
  location = var.location
  name = var.nsg_name

  depends_on = [
    azurerm_subnet.Subnets
  ]
}
resource "azurerm_network_security_rule" "security_rules" {
  count = length(var.security_rules)
  name                        = var.security_rules[count.index].name
  priority                    = var.security_rules[count.index].priority
  direction                   = var.security_rules[count.index].direction
  access                      = var.security_rules[count.index].access
  protocol                    = var.security_rules[count.index].protocol
  source_port_range           = var.security_rules[count.index].source_port_range
  destination_port_range      = var.security_rules[count.index].destination_port_range
  source_address_prefix       = var.security_rules[count.index].source_address_prefix
  destination_address_prefix  = var.security_rules[count.index].destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.nsg_name
  depends_on = [
    azurerm_network_security_group.webnsg
  ]
}

resource "azurerm_subnet_network_security_group_association" "nsg-web" {
  subnet_id                 = azurerm_subnet.Subnets[0].id
  network_security_group_id = azurerm_network_security_group.webnsg.id
  depends_on = [
    azurerm_network_security_group.webnsg
  ]
}