resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku = "Standard"

  frontend_ip_configuration {
    name                 = var.lb_fip_name
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
  depends_on = [
    azurerm_public_ip.publicip
  ]
}

resource "azurerm_lb_rule" "lbrule" {
  count = length(var.rule_name)
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = var.rule_name[count.index].name
  protocol                       = var.rule_name[count.index].protocol
  frontend_port                  = var.rule_name[count.index].frontend_port
  backend_port                   = var.rule_name[count.index].backend_port
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.bap.id]
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
  depends_on = [
    azurerm_lb_backend_address_pool.bap
  ]
}
resource "azurerm_lb_backend_address_pool" "bap" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.bep_Name
  depends_on = [
    azurerm_lb.lb
  ]
}