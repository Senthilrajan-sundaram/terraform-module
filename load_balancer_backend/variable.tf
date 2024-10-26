variable "settings" {
  type = object({
    name = string
    loadbalancer_id = string
    synchronous_mode = optional(string)
    tunnel_interface = optional(object({
      identifier = string
      type = string
      protocol = string
      port = string

    }))
    virtual_network_id = optional(string)

  })
}