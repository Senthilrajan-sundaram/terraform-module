resource "azurerm_key_vault" "this" {
  
  name                            = var.settings.azurerm_key_vault_name
  location                        = var.settings.location
  resource_group_name             = var.settings.resource_group_name
  enabled_for_disk_encryption     = var.settings.enabled_for_disk_encryption
  tenant_id                       = var.settings.tenant_id
  soft_delete_retention_days      = var.settings.soft_delete_retention_days
  purge_protection_enabled        = var.settings.purge_protection_enabled
  tags                            = var.settings.tags
  sku_name                        = var.settings.sku_name
  enabled_for_template_deployment = var.settings.enabled_for_template_deployment
  enabled_for_deployment          = var.settings.enabled_for_deployment
  enable_rbac_authorization       = var.settings.enable_rbac_authorization
  public_network_access_enabled   = var.settings.public_network_access_enabled
  
}

resource "azurerm_key_vault_key" "this" {
  for_each        = try({ for n in var.settings.key_vault_key : n.name => n }, {})
  name            = each.key
  key_vault_id    = azurerm_key_vault.this.id
  key_type        = each.value.key_type
  key_size        = each.value.key_size
  key_opts        = each.value.key_opts
  expiration_date = local.expiration_date
}


