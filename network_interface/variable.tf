variable "settings" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string

    ip_configuration = object({
      name                                               = string
      gateway_load_balancer_frontend_ip_configuration_id = optional(string)
      subnet_id                                          = optional(string)
      private_ip_address_version                         = optional(string)
      private_ip_address_allocation                      = string
      public_ip_address_id                               = optional(string)
      primary                                            = optional(string)
      private_ip_address                                 = optional(string)
    })
    auxiliary_mode                 = optional(string)
    auxiliary_sku                  = optional(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    ip_forwarding_enabled          = optional(string)
    accelerated_networking_enabled = optional(string)
    internal_dns_name_label        = optional(string)
    tags                           = optional(map(string))
  })
}
