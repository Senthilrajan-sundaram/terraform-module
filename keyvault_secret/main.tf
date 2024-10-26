resource "azurerm_key_vault_secret" "this" {
  name         = var.settings.name
  key_vault_id = var.settings.key_vault_id
  value        = var.settings.value

}
