variable "settings" {
  description = "vm configuration."
  type = object({
    name                       = string
    location                   = string
    resource_group_name        = string
    admin_username             = string
    # admin_password             = string
    size                       = string
    network_interface_ids      = list(string)
    availability_set_id        = optional(string)
    enable_automatic_updates   = optional(bool, true)
    encryption_at_host_enabled = optional(bool, false)

    license_type  = optional(string)
    computer_name = optional(string)
    zone          = optional(string)
    tags          = optional(map(string))


    os_disk = object({
      name                      = optional(string)
      caching                   = string
      storage_account_type      = string
      disk_size_gb              = optional(string)
      write_accelerator_enabled = optional(bool, false)
      disk_encryption_set_id    = optional(string)
    })


    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    additional_capabilities = optional(object({
      ultra_ssd_enabled = optional(bool)
    }))

    identity = optional(object({
      type         = string
      identity_ids = list(string)
    }))



  })
}
