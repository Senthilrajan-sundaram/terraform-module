resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  virtual_machine_id       = var.settings.virtual_machine_id
  managed_disk_id          = var.settings.managed_disk_id
  lun                      = var.settings.lun
  caching                  = var.settings.caching
  create_option            = var.settings.create_option
  write_accelerator_enabled = var.settings.write_accelerator_enabled
}