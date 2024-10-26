variable "settings" {
  type = object({
    name                             = string
    resource_group_name              = string
    location                         = string
    account_tier                     = string
    account_replication_type         = string
    account_kind                     = optional(string)
    cross_tenant_replication_enabled = optional(bool)
    access_tier                      = optional(string)
    edge_zone                        = optional(string)
    https_traffic_only_enabled       = optional(bool)
    min_tls_version                  = optional(string)
    allow_nested_items_to_be_public  = optional(bool)
    shared_access_key_enabled        = optional(bool)
    public_network_access_enabled    = optional(bool)
    default_to_oauth_authentication  = optional(bool)
    is_hns_enabled                   = optional(string)
    nfsv3_enabled                    = optional(bool)

    custom_domain = optional(object({
      name          = string
      use_subdomain = optional(string)
    }))
    customer_managed_key = optional(object({
      key_vault_key_id          = optional(string)
      managed_hsm_key_id        = optional(string)
      user_assigned_identity_id = string

    }))
    identity = optional(object({
      identity_ids = optional(list(string))
      type         = string
    }))
    blob_properties = optional(object({
      cors_rule = optional(object({
        allowed_headers    = list(string)
        allowed_methods    = list(string)
        allowed_origins    = list(string)
        exposed_headers    = list(string)
        max_age_in_seconds = number
      }))
      delete_retention_policy = optional(object({
        days                     = number
        permanent_delete_enabled = bool
      }))
      restore_policy = optional(object({
        days = number
      }))
      container_delete_retention_policy = optional(object({
        days = number
      }))

    }))
    queue_properties = optional(object({
      cors_rule = optional(object({
        allowed_headers    = list(string)
        allowed_methods    = list(string)
        allowed_origins    = list(string)
        exposed_headers    = list(string)
        max_age_in_seconds = number
      }))
      logging = optional(object({
        delete                = string
        read                  = string
        version               = string
        write                 = string
        retention_policy_days = optional(number)
      }))
      minute_metrics = optional(object({
        enabled               = string
        version               = string
        include_apis          = optional(string)
        retention_policy_days = number
      }))
      hour_metrics = optional(object({
        enabled               = string
        version               = string
        include_apis          = optional(string)
        retention_policy_days = number
      }))
    }))
    static_website = optional(object({
      index_document     = string
      error_404_document = string
    }))
    share_properties = optional(object({
      cors_rule = optional(object({
        allowed_headers    = list(string)
        allowed_methods    = list(string)
        allowed_origins    = list(string)
        exposed_headers    = list(string)
        max_age_in_seconds = number
      }))
      retention_policy = optional(object({
        days = optional(number)
      }))
      smb = optional(object({
        versions                        = optional(string)
        authentication_types            = optional(string)
        kerberos_ticket_encryption_type = optional(string)
        channel_encryption_type         = optional(string)
        multichannel_enabled            = optional(string)
      }))
    }))
  })
}
