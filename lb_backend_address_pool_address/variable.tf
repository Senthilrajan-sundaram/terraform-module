variable "settings" {
  type = object({
    name = string
    backend_address_pool_id = string
    ip_address = optional(string)
    virtual_network_id = optional(string)
    backend_address_ip_configuration_id = optional(string)
  })
}