resource "azurerm_mssql_database" "db" {
  name = var.database_name
  server_id = azurerm_mssql_server.sql_server.id
  depends_on = [
    azurerm_mssql_server.sql_server
  ]
}