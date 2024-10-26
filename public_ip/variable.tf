variable "settings" {
  type = object({
    name                     = string
    resource_group_name      = string
    location                 = string
    allocation_method        = string
    zone                     = optional(list(string))           # Optional: list of availability zones
    ddos_protection_mode     = optional(string)                 # Optional: "Enabled" or "Disabled"
    ddos_protection_plan_id  = optional(string)                 # Optional: DDoS protection plan ID
    domain_name_label        = optional(string)                 # Optional: DNS name label
    edge_zone                = optional(string)                 # Optional: Edge zone services
    idle_timeout_in_minutes  = optional(number)                 # Optional: Idle timeout in minutes
    ip_tags                  = optional(map(string))      # Optional: List of IP tags
    ip_version               = optional(string)                 # Optional: "IPv4" or "IPv6"
    public_ip_address_id     = optional(string)                 # Optional: Public IP prefix ID
    reverse_fqdn             = optional(string)                 # Optional: Reverse FQDN
    sku                      = optional(string)                 # Optional: "Basic" or "Standard"
    sku_tier                 = optional(string)                 # Optional: SKU tier
    tags                     = optional(map(string))            # Optional: Map of tags
  })
}