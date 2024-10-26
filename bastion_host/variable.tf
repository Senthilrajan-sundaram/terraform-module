variable "settings" {
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    copy_paste_enabled  = optional(string)
    file_copy_enabled   = optional(string)
    sku                 = optional(string)
    
    ip_configuration = object({
      name                 = string
      subnet_id            = string
      public_ip_address_id = string
    })

    ip_connect_enabled        = optional(bool)
    kerberos_enabled          = optional(bool)
    scale_units               = optional(number)
    shareable_link_enabled    = optional(bool)
    tunneling_enabled         = optional(bool)
    session_recording_enabled = optional(bool)
    virtual_network_id        = optional(string)
    tags                      = optional(map(string))
  })
}