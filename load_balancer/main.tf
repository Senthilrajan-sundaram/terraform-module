resource "azurerm_lb" "this" {
  name                = var.settings.name
  resource_group_name = var.settings.resource_group_name
  location            = var.settings.location
  

  dynamic "frontend_ip_configuration" {
    for_each = var.settings.frontend_ip_configuration != null ? [var.settings.frontend_ip_configuration] : []

    content {
      name                                               = frontend_ip_configuration.value.name
      zones                                              = frontend_ip_configuration.value.zones
      subnet_id                                          = frontend_ip_configuration.value.subnet_id
      gateway_load_balancer_frontend_ip_configuration_id = frontend_ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id
      private_ip_address                                 = frontend_ip_configuration.value.private_ip_address
      private_ip_address_allocation                      = frontend_ip_configuration.value.private_ip_address_allocation
      private_ip_address_version                         = frontend_ip_configuration.value.private_ip_address_version
      public_ip_address_id                               = frontend_ip_configuration.value.public_ip_address_id
      public_ip_prefix_id                                = frontend_ip_configuration.value.public_ip_prefix_id
    }
  }
  

  sku      = var.settings.sku
  sku_tier = var.settings.sku_tier
  tags     = var.settings.tags
}
