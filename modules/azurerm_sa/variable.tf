variable "storage_accounts"{
    type= map(object({
        sa_name                   = string
        rg_name                   = string
        location                  = string
        account_tier              = string
        account_replication_type  = string

        
        min_tls_version          = optional(string)

        tags =  optional(map(string))
    }))
}