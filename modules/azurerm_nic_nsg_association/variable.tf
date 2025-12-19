variable "vm_nsg_associations" {
    type=map(object({
        nic_name = string
        rg_name = string
        nsg_name = string
    }))
 
}