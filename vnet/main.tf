resource "azurerm_virtual_network" "this" {

  name                = var.settings.name
  location            = var.settings.location
  resource_group_name = var.settings.resource_group_name
  address_space       = var.settings.address_space
  dns_servers         = var.settings.dns_servers

  dynamic "subnet" {
    for_each = var.settings.subnet != null ? var.settings.subnet : []
    content {
      name                                          = subnet.value.name
      address_prefixes                              = subnet.value.address_prefixes
      security_group                                = subnet.value.security_group
      default_outbound_access_enabled               = subnet.value.default_outbound_access_enabled
      private_endpoint_network_policies             = subnet.value.private_endpoint_network_policies
      private_link_service_network_policies_enabled = subnet.value.private_link_service_network_policies_enabled
      route_table_id                                = subnet.value.route_table_id
      service_endpoints                             = subnet.value.service_endpoints
      service_endpoint_policy_ids                   = subnet.value.service_endpoint_policy_ids
      dynamic "delegation" {
        for_each = subnet.value.delegation != null ? subnet.value.delegation : []
        content {
          name = delegation.value.name
          dynamic "service_delegation" {
            for_each = delegation.value.service_delegation != null ? delegation.value.service_delegation : []
            content {
              name    = service_delegation.value.name
              actions = service_delegation.value.actions
            }

          }

        }


      }





    }
  }



}


