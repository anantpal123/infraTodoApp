variable "vnets" {
  type = map(object({
    vnet_name     = string
    rg_name       = string
    location      = string
    address_space = list(string)
    dns_servers   = optional(list(string), [])
    subnets = optional(map(object({
      subnet_name      = string
      address_prefixes = list(string)
    })), {})

    tags = optional(map(string))


    }
  ))
}
