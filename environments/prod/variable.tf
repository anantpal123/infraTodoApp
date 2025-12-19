variable "rgs" {

  type = map(object({
    rg_name  = string
    location = string

    managed_by = optional(string)

    tags = optional(map(string))


  }))
}
variable "storage_accounts" {
  type = map(object({
    sa_name                  = string
    rg_name                  = string
    location                 = string
    account_tier             = string
    account_replication_type = string


    min_tls_version = optional(string)

    tags = optional(map(string))
  }))
}

variable "vnets" {
  type = map(object({
    vnet_name     = string
    rg_name       = string
    location      = string
    address_space = list(string)
    dns_servers   = optional(list(string), [])
    subnets = optional(map(object({
      subnet_name             = string
      address_prefixes = list(string)
    })), {})

    tags = optional(map(string))


    }
  ))
}
variable "pips" {}
variable "mssql_servers" {}
variable "mssql_databases" {}
variable "vms" {}
variable "nsgs" {}
variable "vm_nsg_associations" {}
variable "kvs" {}

  
