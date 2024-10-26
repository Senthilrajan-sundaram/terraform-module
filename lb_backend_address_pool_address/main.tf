resource "azurerm_lb_backend_address_pool_address" "this" {
  backend_address_pool_id             = var.settings.backend_address_pool_id
  ip_address                          = var.settings.ip_address
  name                                = var.settings.name
  virtual_network_id                  = var.settings.virtual_network_id
  backend_address_ip_configuration_id = var.settings.backend_address_ip_configuration_id

}
