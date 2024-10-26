variable "settings" {
  type = object({
    virtual_machine_id         = string
    managed_disk_id            = string
    create_option              = optional(string)
    write_accelerator_enabled  = optional(string)
  })
}