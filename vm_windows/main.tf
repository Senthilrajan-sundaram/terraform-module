resource "random_password" "this" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
resource "azurerm_windows_virtual_machine" "this" {
  name                       = var.settings.name
  resource_group_name        = var.settings.resource_group_name
  location                   = var.settings.location
  size                       = var.settings.size
  admin_username             = var.settings.admin_username
  admin_password             = random_password.this.result
  availability_set_id        = var.settings.availability_set_id
  network_interface_ids      = var.settings.network_interface_ids
  enable_automatic_updates   = var.settings.enable_automatic_updates
  encryption_at_host_enabled = var.settings.encryption_at_host_enabled
  license_type               = var.settings.license_type
  computer_name              = var.settings.computer_name
  tags                       = var.settings.tags
  zone                       = var.settings.zone
  



  dynamic "additional_capabilities" {
    for_each = var.settings.additional_capabilities != null ? [var.settings.additional_capabilities] : []
    content {
      ultra_ssd_enabled = var.settings.additional_capabilities.ultra_ssd_enabled
    }
  }

  dynamic "identity" {
    for_each = var.settings.identity != null ? [var.settings.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }


  os_disk {
    name                      = var.settings.os_disk.name
    caching                   = var.settings.os_disk.caching
    storage_account_type      = var.settings.os_disk.storage_account_type
    disk_size_gb              = var.settings.os_disk.disk_size_gb
    write_accelerator_enabled = var.settings.os_disk.write_accelerator_enabled
    disk_encryption_set_id    = var.settings.os_disk.disk_encryption_set_id
  }

  source_image_reference {
    publisher = var.settings.source_image_reference.publisher
    offer     = var.settings.source_image_reference.offer
    sku       = var.settings.source_image_reference.sku
    version   = var.settings.source_image_reference.version
  }
}


