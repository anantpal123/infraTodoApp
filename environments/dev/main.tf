module "rg" {
  source = "../../modules/azurerm_rg"
  rgs    = var.rgs
}
module "sa" {
  depends_on       = [module.rg]
  source           = "../../modules/azurerm_sa"
  storage_accounts = var.storage_accounts
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_vnet"
  vnets      = var.vnets
}
module "pip" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_pip"
  pips       = var.pips
}
module "mssql_server" {
  depends_on    = [module.rg]
  source        = "../../modules/azurerm_mssql_server"
  mssql_servers = var.mssql_servers
}
module "mssql_databases" {
  depends_on    = [module.mssql_server]
  source        = "../../modules/azurerm_mssql_db"
  mssql_databases = var.mssql_databases
}

module "vm" {
  depends_on    = [module.rg, module.mssql_databases, module.pip, module.vnet]
  source        = "../../modules/azurerm_vm"
  vms = var.vms
}
module "nsgs" {
depends_on = [module.rg, module.mssql_databases, module.pip, module.vnet, module.vm]
  source = "../../modules/azurerm_nsg"
  nsgs=var.nsgs
}

module "vm_nsg_associations" {
  depends_on    = [module.rg, module.mssql_databases, module.pip, module.vnet, module.vm,module.nsgs]
  source = "../../modules/azurerm_nic_nsg_association"
  vm_nsg_associations = var.vm_nsg_associations
}

module "kvs" {
  depends_on    = [module.rg, module.mssql_databases, module.pip, module.vnet, module.vm]
  source = "../../modules/azurerm_keyvault"
  kvs = var.kvs
}


