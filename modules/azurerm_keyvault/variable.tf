variable "kvs" {
  description = "Map of Key Vault configurations"
  type = map(object({
    kv_name                     = string
    location                    = string
    rg_name                     = string
    enabled_for_disk_encryption = optional(bool, false)
    soft_delete_retention_days  = optional(number, 7)
    purge_protection_enabled    = optional(bool, false)
    sku_name                    = string

    access_policies = optional(
      map(object({
        key_permissions     = optional(list(string), [])
        secret_permissions  = optional(list(string), [])
        storage_permissions = optional(list(string), [])
      })),
      {}
    )
  }))
}
