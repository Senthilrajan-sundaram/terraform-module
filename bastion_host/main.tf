resource "azurerm_bastion_host" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location
  copy_paste_enabled  = var.settings.copy_paste_enabled
  file_copy_enabled   = var.settings.file_copy_enabled
  sku                 = var.settings.sku

  dynamic "ip_configuration" {
    for_each = var.settings.ip_configuration != null ? [var.settings.ip_configuration] : []
    content {
      name                 = ip_configuration.value.name
      subnet_id            = ip_configuration.value.subnet_id
      public_ip_address_id = ip_configuration.value.public_ip_address_id
    }
  }

  ip_connect_enabled       = var.settings.ip_connect_enabled
  kerberos_enabled         = var.settings.kerberos_enabled
  scale_units              = var.settings.scale_units
  shareable_link_enabled   = var.settings.shareable_link_enabled
  tunneling_enabled        = var.settings.tunneling_enabled
  session_recording_enabled = var.settings.session_recording_enabled
  virtual_network_id       = var.settings.virtual_network_id
  tags                    = var.settings.tags
}