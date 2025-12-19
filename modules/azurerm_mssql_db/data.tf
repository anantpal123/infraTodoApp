  data "azurerm_mssql_server" "mssqlserver" {
    for_each = var.mssql_databases
    name                = each.value.server_name
    resource_group_name = each.value.rg_name
  }