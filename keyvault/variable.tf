variable "settings" {
  description = "Key vault configuration."
  type = object({
    azurerm_key_vault_name          = string
    location                        = string
    resource_group_name             = string
    sku_name                        = optional(string, "premium")
    purge_protection_enabled        = optional(bool, false)
    tags                            = optional(map(string), null)
    enabled_for_disk_encryption     = optional(bool, true)
    tenant_id                       = string
    soft_delete_retention_days      = optional(number)
    enabled_for_template_deployment = optional(bool)
    enabled_for_deployment          = optional(bool)
    enable_rbac_authorization       = optional(bool)
    public_network_access_enabled   = optional(bool)
    secret_expiration_date          = optional(string)

    key_vault_key = optional(list(object({
      name     = string
      key_type = optional(string, "RSA-HSM")
      key_size = optional(number, 2048)
      key_opts = optional(list(string), [
        "decrypt",
        "encrypt",
        "sign",
        "unwrapKey",
        "verify",
        "wrapKey"
      ])
  })))

  })

}
