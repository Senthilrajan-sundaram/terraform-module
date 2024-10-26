resource "azurerm_lb_backend_address_pool" "this" {
    name = var.settings.name
    loadbalancer_id = var.settings.loadbalancer_id
    synchronous_mode = var.settings.synchronous_mode
    dynamic "tunnel_interface" {
      for_each = var.settings.tunnel_interface != null ? [var.settings.tunnel_interface] : []
      content {
        identifier = tunnel_interface.value.identifier
        type = tunnel_interface.value.type
        protocol = tunnel_interface.value.protocol
        port = tunnel_interface.value.port
      }
    }
    virtual_network_id = var.settings.virtual_network_id
  
}