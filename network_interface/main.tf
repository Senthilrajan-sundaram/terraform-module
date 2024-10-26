resource "azurerm_network_interface" "this" {
  name                = var.settings.name
  location            = var.settings.location
  resource_group_name = var.settings.resource_group_name

  dynamic "ip_configuration" {
    for_each = var.settings.ip_configuration != null ? [var.settings.ip_configuration] : []
    content {
      name                                               = ip_configuration.value.name
      gateway_load_balancer_frontend_ip_configuration_id = ip_configuration.value.gateway_load_balancer_frontend_ip_configuration_id
      subnet_id                                          = ip_configuration.value.subnet_id
      private_ip_address_version                         = ip_configuration.value.private_ip_address_version
      private_ip_address_allocation                      = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id                               = ip_configuration.value.public_ip_address_id
      primary                                            = ip_configuration.value.primary
      private_ip_address                                 = ip_configuration.value.private_ip_address
    }
  }

  auxiliary_mode                 = var.settings.auxiliary_mode
  auxiliary_sku                  = var.settings.auxiliary_sku
  dns_servers                    = var.settings.dns_servers
  edge_zone                      = var.settings.edge_zone
  ip_forwarding_enabled          = var.settings.ip_forwarding_enabled
  accelerated_networking_enabled = var.settings.accelerated_networking_enabled
  internal_dns_name_label        = var.settings.internal_dns_name_label
  tags                           = var.settings.tags
}
