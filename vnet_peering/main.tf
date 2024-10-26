resource "azurerm_virtual_network_peering" "this" {
  name                                   = var.settings.name
  resource_group_name                    = var.settings.resource_group_name
  virtual_network_name                   = var.settings.virtual_network_name
  remote_virtual_network_id              = var.settings.remote_virtual_network_id
  allow_virtual_network_access           = var.settings.allow_virtual_network_access
  allow_forwarded_traffic                = var.settings.allow_forwarded_traffic
  allow_gateway_transit                  = var.settings.allow_gateway_transit
  use_remote_gateways                    = var.settings.use_remote_gateways
  local_subnet_names                     = var.settings.local_subnet_names
  only_ipv6_peering_enabled              = var.settings.only_ipv6_peering_enabled
  peer_complete_virtual_networks_enabled = var.settings.peer_complete_virtual_networks_enabled
  remote_subnet_names                    = var.settings.remote_subnet_names
  triggers                               = var.settings.triggers

}

