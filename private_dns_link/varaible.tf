variable "settings" {
  type = object({
    name                 = string
    resource_group_name  = string
    virtual_network_id   = string
    private_dns_zone_name = string
    registration_enabled = optional(bool)
    tags                 = optional(map(string))

  })
}
