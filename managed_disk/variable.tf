variable "settings" {
  type = object({
    name                   = string
    resource_group_name    = string
    location               = string
    storage_account_type   = string
    create_option          = string
    disk_encryption_set_id = optional(string)
    disk_iops_read_write   = optional(number)
    disk_mbps_read_write   = optional(string)
    disk_iops_read_only    = optional(number)
    disk_mbps_read_only    = optional(string)
    upload_size_bytes      = optional(string)
    disk_size_gb           = optional(string)
    edge_zone              = optional(string)
    encryption_settings = optional(object({
      disk_encryption_key = object({
        secret_url      = string
        source_vault_id = string
      })
      key_encryption_key = object({
        key_url         = string
        source_vault_id = string
      })
    }))
    hyper_v_generation                = optional(string)
    image_reference_id                = optional(string)
    gallery_image_reference_id        = optional(string)
    logical_sector_size               = optional(number)
    optimized_frequent_attach_enabled = optional(bool)
    performance_plus_enabled          = optional(bool, false)
    os_type                           = optional(string)
    source_resource_id                = optional(string)
    source_uri                        = optional(string)
    storage_account_id                = optional(string)
    tier                              = optional(string)
    max_shares                        = optional(string)
    trusted_launch_enabled            = optional(bool)
    security_type                     = optional(string)
    secure_vm_disk_encryption_set_id  = optional(string)
    on_demand_bursting_enabled        = optional(bool)
    tags                              = optional(map(string))
    zone                              = optional(string)
    network_access_policy             = optional(string)
    disk_access_id                    = optional(string)
    public_network_access_enabled     = optional(bool)
  })
}