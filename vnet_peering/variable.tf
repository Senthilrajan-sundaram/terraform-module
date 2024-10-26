variable "settings" {
    type = object({
      name = string
      virtual_network_name = string
      remote_virtual_network_id = string
      resource_group_name = string
      allow_virtual_network_access = optional(string)
      allow_forwarded_traffic = optional(bool)
      allow_gateway_transit = optional(bool)
      local_subnet_names = optional(list(string))
      only_ipv6_peering_enabled = optional(string)
      peer_complete_virtual_networks_enabled = optional(bool)
      remote_subnet_names = optional(list(string))
      use_remote_gateways = optional(bool)
      triggers = optional(map(string))
    })
  
}