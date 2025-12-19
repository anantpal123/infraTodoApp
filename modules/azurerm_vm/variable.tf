variable "vms" {
  type = map(object({
    vm_name        = string
    rg_name        = string
    location       = string
    vm_size        = string
    admin_username = string
    admin_password = string
    script_name    = string
    nic_name       = string
    subnet_name    = string
    vnet_name      = string
    pip_name       = string
    
   

    os_disk = object({
      caching              = string
      storage_account_type = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))

}
