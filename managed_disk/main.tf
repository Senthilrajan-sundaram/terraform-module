resource "azurerm_managed_disk" "this" {
  name                   = var.settings.name
  resource_group_name    = var.settings.resource_group_name
  location               = var.settings.location
  storage_account_type   = var.settings.storage_account_type
  create_option          = var.settings.create_option
  disk_encryption_set_id = var.settings.disk_encryption_set_id
  disk_iops_read_write   = var.settings.disk_iops_read_write
  disk_mbps_read_write   = var.settings.disk_mbps_read_write
  disk_iops_read_only    = var.settings.disk_iops_read_only
  disk_mbps_read_only    = var.settings.disk_mbps_read_only
  upload_size_bytes      = var.settings.upload_size_bytes
  disk_size_gb           = var.settings.disk_size_gb
  edge_zone              = var.settings.edge_zone
  dynamic "encryption_settings" {
    for_each = var.settings.encryption_settings != null ? [var.settings.encryption_settings] : []
    content {
      dynamic "disk_encryption_key" {
        for_each = encryption_settings.value.disk_encryption_key != null ? [encryption_settings.value.disk_encryption_key] : []
        content {
          secret_url      = disk_encryption_key.value.secret_url
          source_vault_id = disk_encryption_key.value.source_vault_id
        }
      }

      dynamic "key_encryption_key" {
        for_each = encryption_settings.value.key_encryption_key != null ? [encryption_settings.value.key_encryption_key] : []
        content {
          key_url         = key_encryption_key.value.key_url
          source_vault_id = key_encryption_key.value.source_vault_id
        }
      }
    }
  }
  hyper_v_generation                = var.settings.hyper_v_generation
  image_reference_id                = var.settings.image_reference_id
  gallery_image_reference_id        = var.settings.gallery_image_reference_id
  logical_sector_size               = var.settings.logical_sector_size
  optimized_frequent_attach_enabled = var.settings.optimized_frequent_attach_enabled
  performance_plus_enabled          = var.settings.performance_plus_enabled
  os_type                           = var.settings.os_type
  source_resource_id                = var.settings.source_resource_id
  source_uri                        = var.settings.source_uri
  storage_account_id                = var.settings.storage_account_id
  tier                              = var.settings.tier
  max_shares                        = var.settings.max_shares
  trusted_launch_enabled            = var.settings.trusted_launch_enabled
  security_type                     = var.settings.security_type
  secure_vm_disk_encryption_set_id  = var.settings.secure_vm_disk_encryption_set_id
  on_demand_bursting_enabled        = var.settings.on_demand_bursting_enabled
  tags                              = var.settings.tags
  zone                              = var.settings.zone
  network_access_policy             = var.settings.network_access_policy
  disk_access_id                    = var.settings.disk_access_id
  public_network_access_enabled     = var.settings.public_network_access_enabled
}
