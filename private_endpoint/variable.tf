variable "settings" {
  type = object({
    name                          = string
    resource_group_name           = string
    location                      = string
    subnet_id                     = string
    custom_network_interface_name = optional(string)
    private_dns_zone_group = optional(object({
      name                 = string
      private_dns_zone_ids = list(string)
    }))
    private_service_connection = object({
      name                              = string
      is_manual_connection              = bool
      private_connection_resource_id    = optional(string)
      private_connection_resource_alias = optional(string)
      subresource_names                 = optional(list(string))
      request_message                   = optional(bool)
    })
    ip_configuration = optional(object({
      name               = string
      private_ip_address = string
      subresource_name   = optional(string)
      member_name        = optional(string)
    }))
  })
}
