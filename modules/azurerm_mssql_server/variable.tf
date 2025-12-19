variable "mssql_servers" {
    type=map(object({
        server_name =string
        rg_name =string
        location =string
        version =string
        administrator_login =string
        administrator_login_password =string
        minimum_tls_version =string
        azuread_administrators =optional(list(object({
            login_username =string
            object_id =string
        })),[])
        tags =map(string)
        
    }))
  
}