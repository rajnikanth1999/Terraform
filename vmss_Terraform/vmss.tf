data "azurerm_shared_image" "image" {
  name          = var.image_name
  gallery_name        = var.gallery_name
  resource_group_name = var.image_rg_name
}

resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = var.vmss_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.vmss_size
  instances           = var.vmss_count
  admin_username      = var.vmss_name
  admin_password = var.vmss_password
  source_image_id = data.azurerm_shared_image.image.id
  disable_password_authentication = false

#   source_image_reference {
#     publisher = var.publisher
#     offer     = var.offer
#     sku       = var.sku
#     version   = var.vmss_version
#   }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = var.nic_name
    primary = true

    ip_configuration {
      name      = var.vmss_ipconfig
      primary   = true
      subnet_id = azurerm_subnet.Subnets[0].id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bap.id]
    }
  }
  depends_on = [
    azurerm_lb_backend_address_pool.bap
  ]
}