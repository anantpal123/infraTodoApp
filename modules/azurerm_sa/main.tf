resource "azurerm_storage_account" "storage143" {
  for_each = var.storage_accounts

  name                     = each.value.sa_name
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  
  min_tls_version          = each.value.min_tls_version

  tags = each.value.tags
}