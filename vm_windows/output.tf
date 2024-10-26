output "id" {
  description = "The ID of the Windows Virtual Machine."
  value       = azurerm_windows_virtual_machine.this.id
}

output "vmpassword" {
  value = random_password.this.result
  sensitive = true
}
