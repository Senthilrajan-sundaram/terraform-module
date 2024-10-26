resource "azurerm_key_vault" "this" {

  name                            = var.settings.name
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


