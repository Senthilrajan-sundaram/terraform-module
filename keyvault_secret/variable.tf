variable "settings" {
  type = object({
    name = string
    value = string
    key_vault_id = string
  })
}