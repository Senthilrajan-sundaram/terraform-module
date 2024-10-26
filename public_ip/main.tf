resource "azurerm_public_ip" "this" {
  name                    = var.settings.name
  resource_group_name     = var.settings.resource_group_name
  location                = var.settings.location
  allocation_method       = var.settings.allocation_method
  zones                   = var.settings.zone
  ddos_protection_mode    = var.settings.ddos_protection_mode
  ddos_protection_plan_id = var.settings.ddos_protection_plan_id
  domain_name_label       = var.settings.domain_name_label
  edge_zone               = var.settings.edge_zone
  idle_timeout_in_minutes = var.settings.idle_timeout_in_minutes
  ip_tags                 = var.settings.ip_tags
  ip_version              = var.settings.ip_version
  public_ip_prefix_id     = var.settings.public_ip_address_id
  reverse_fqdn            = var.settings.reverse_fqdn
  sku                     = var.settings.sku
  sku_tier                = var.settings.sku_tier
  tags                    = var.settings.tags

}
