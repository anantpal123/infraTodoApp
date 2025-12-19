
rgs = {
  rg1 = {
    rg_name    = "anant-dev-rg1"
    location   = "eastus2"
    managed_by = "terraform"
    tags = {
      environment = "dev"
      owner       = "chandra"
    }
  }
  rg2 = {
    rg_name  = "anant-rg-dev-002"
    location = "eastus2"
  }
}


storage_accounts = {
  sa1 = {
    sa_name                  = "anantstorageact"
    rg_name                  = "anant-dev-rg1"
    location                 = "eastus2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    min_tls_version          = "TLS1_2"
    tags = {
      environment = "dev"
    }
  }
}

vnets = {
  vnet1 = {
    vnet_name     = "anant-vnet-001"
    rg_name       = "anant-dev-rg1"
    location      = "eastus2"
    address_space = ["10.0.0.0/16"]
    dns_servers   = ["10.0.0.4", "10.0.0.5"]
    subnets = {
      subnet1 = {
        subnet_name      = "anant-frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        subnet_name      = "anant-backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
    tags = {
      environment = "dev"
    }

  }
}
pips = {
  pip1 = {
    pip_name                = "anant-frontend-pip-1"
    location                = "eastus2"
    rg_name                 = "anant-dev-rg1"
    allocation_method       = "Static"
    idle_timeout_in_minutes = 30
    tags = {
      environment = "dev"
    }
  }
  pip2 = {
    pip_name                = "anant-backend-pip-1"
    location                = "eastus2"
    rg_name                 = "anant-dev-rg1"
    allocation_method       = "Static"
    idle_timeout_in_minutes = 30
    tags = {
      environment = "dev"
    }
  }
}

mssql_servers = {
  mssql1 = {
    server_name                  = "anant-mssql-04"
    rg_name                      = "anant-dev-rg1"
    location                     = "eastus2"
    version                      = "12.0"
    administrator_login          = "sqladminuser"
    administrator_login_password = "P@ssword1234"
    minimum_tls_version          = "1.2"

    tags = {
      environment = "dev"
    }
  }
}

mssql_databases = {
  db1 = {
    db_name      = "anant_mssql_db_dev_001"
    server_name  = "anant-mssql-04"
    rg_name      = "anant-dev-rg1"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
    tags = {
      environment = "dev"
    }
  }

}

vms = {
  vm1 = {
    vm_name        = "frontend-dev-001"
    rg_name        = "anant-dev-rg1"
    location       = "eastus2"
    vm_size        = "Standard_D2s_v3"
    admin_username = "adminuser"
    admin_password = "P@ssword1234"
    script_name    = "nginx.sh"
    nic_name       = "frontend-nic-dev-001"
    subnet_name    = "anant-frontend-subnet"
    vnet_name      = "anant-vnet-001"
    pip_name       = "anant-frontend-pip-1"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts" 
      version   = "latest"
    }
  }
  vm2 = {
    vm_name        = "backend-dev-001"
    rg_name        = "anant-dev-rg1"
    location       = "eastus2"
    vm_size        = "Standard_D2s_v3"
    admin_username = "adminuser"
    admin_password = "P@ssword1234"
    script_name    = "nginx.sh"
    nic_name       = "backend-nic-dev-001"
    subnet_name    = "anant-backend-subnet"
    vnet_name      = "anant-vnet-001"
    pip_name       = "anant-backend-pip-1"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }
}

nsgs = {
  nsg1 = {
    nsg_name = "anant-frontend-nsg"
    location = "eastus2"
    rg_name  = "anant-dev-rg1"
    security_rules = {
      sr1 = {
        rule_name                  = "rule1"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

    }

  }
  nsg2 = {
    nsg_name = "anant-backend-nsg"
    location = "eastus2"
    rg_name  = "anant-dev-rg1"
    security_rules = {
      sr2 = {
        rule_name                  = "rule2"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

    }

  }
}
vm_nsg_associations = {
  frontend_assoication = {
    nic_name = "frontend-nic-dev-001"
    nsg_name = "anant-frontend-nsg"
    rg_name  = "anant-dev-rg1"
  }
  backend_assoication = {
    nic_name = "backend-nic-dev-001"
    nsg_name = "anant-backend-nsg"
    rg_name  = "anant-dev-rg1"
  }
}

// kvs = {
//   kv1 = {
//     kv_name                     = "anant-kv-001"
//     location                    = "eastus2"
//     rg_name                     = "anant-dev-rg1"
//     enabled_for_disk_encryption = true
//     soft_delete_retention_days  = 7
//     purge_protection_enabled    = false
//     sku_name                    = "standard"
//     access_policies = {
//       acc1 = {
//         key_permissions = [
//           "Get",
//         ]

//         secret_permissions = [
//           "Get",
//         ]

//         storage_permissions = [
//           "Get",
//         ]
      // }
  //   }
  // }
// }


