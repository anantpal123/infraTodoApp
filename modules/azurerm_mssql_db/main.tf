resource "azurerm_mssql_database" "mssqldb" {
    for_each = var.mssql_databases
  name         = each.value.db_name
 server_id    = data.azurerm_mssql_server.mssqlserver[each.key].id
collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

  tags = each.value.tags
    
  }



 
    
  
  