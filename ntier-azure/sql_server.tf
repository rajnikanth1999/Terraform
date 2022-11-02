resource "azurerm_mssql_server" "sql_server" {
  location = var.location
  name = var.sql_server_name
  resource_group_name = var.resource_group_name
  version = var.sql_server_version
  administrator_login = var.username
  administrator_login_password = var.password
  public_network_access_enabled = var.sql_server_public_access
  depends_on = [
    azurerm_virtual_machine.app
  ]
}
resource "azurerm_mssql_firewall_rule" "server_firewall" {
  name                = var.firewall_rule_name
  server_id = azurerm_mssql_server.sql_server.id
  start_ip_address    = var.sql_firewall_rule_end_ip
  end_ip_address      = var.sql_firewall_rule_end_ip
  depends_on = [
    azurerm_mssql_server.sql_server
  ]
}