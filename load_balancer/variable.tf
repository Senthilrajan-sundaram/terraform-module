variable "settings" {
  description = "Settings for the Azure Load Balancer configuration"
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    edge_zone = optional(string)
    frontend_ip_configuration = optional(object({
      name                                               = string
      zones                                              = optional(list(string), [])
      subnet_id                                          = optional(string)
      gateway_load_balancer_frontend_ip_configuration_id = optional(string)
      private_ip_address                                 = optional(string)
      private_ip_address_allocation                      = optional(string)
      private_ip_address_version                         = optional(string)
      public_ip_address_id                               = optional(string)
      public_ip_prefix_id                                = optional(string)
    }), null)
    sku      = string
    sku_tier = string
    tags     = optional(map(string), {})
  })
}
