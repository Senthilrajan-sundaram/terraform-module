variable "settings" {
  type = object({
    name = string
    location = string
    os_type = string
    resource_group_name = string
    sku_name = string
    app_service_environment_id = optional(string)
    maximum_elastic_worker_count = optional(string)
    worker_count = optional(string)
    per_site_scaling_enabled = optional(string)
    zone_balancing_enabled = optional(string)
    tags = optional(string)

  })
}