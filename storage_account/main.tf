resource "azurerm_storage_account" "this" {
  name                             = var.settings.name
  resource_group_name              = var.settings.resource_group_name
  location                         = var.settings.location
  account_tier                     = var.settings.account_tier
  account_replication_type         = var.settings.account_replication_type
  account_kind                     = var.settings.account_kind
  cross_tenant_replication_enabled = var.settings.cross_tenant_replication_enabled
  access_tier                      = var.settings.access_tier
  edge_zone                        = var.settings.edge_zone
  https_traffic_only_enabled       = var.settings.https_traffic_only_enabled
  min_tls_version                  = var.settings.min_tls_version
  allow_nested_items_to_be_public  = var.settings.allow_nested_items_to_be_public
  shared_access_key_enabled        = var.settings.shared_access_key_enabled
  public_network_access_enabled    = var.settings.public_network_access_enabled
  default_to_oauth_authentication  = var.settings.default_to_oauth_authentication
  is_hns_enabled                   = var.settings.is_hns_enabled
  nfsv3_enabled                    = var.settings.nfsv3_enabled

  dynamic "custom_domain" {
    for_each = var.settings.custom_domain != null ? [var.settings.custom_domain] : []
    content {
      name          = custom_domain.value.name
      use_subdomain = custom_domain.value.use_subdomain
    }

  }
  dynamic "customer_managed_key" {
    for_each = var.settings.customer_managed_key != null ? [var.settings.customer_managed_key] : []

    content {
      key_vault_key_id          = customer_managed_key.value.key_vault_key_id
      managed_hsm_key_id        = customer_managed_key.value.managed_hsm_key_id
      user_assigned_identity_id = customer_managed_key.value.user_assigned_identity_id

    }

  }
  dynamic "identity" {
    for_each = var.settings.identity != null ? [var.settings.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }

  }
  dynamic "blob_properties" {
    for_each = var.settings.blob_properties != null ? [var.settings.blob_properties] : []
    content {
      versioning_enabled            = blob_properties.value.versioning_enabled
      change_feed_enabled           = blob_properties.value.change_feed_enabled
      change_feed_retention_in_days = blob_properties.value.change_feed_retention_in_days
      default_service_version       = blob_properties.value.default_service_version
      last_access_time_enabled      = blob_properties.value.last_access_time_enabled

      dynamic "cors_rule" {
        for_each = blob_properties.value.cors_rule != null ? [blob_properties.value.cors_rule] : []
        content {
          allowed_headers    = cors_rule.value.allowed_headers
          allowed_methods    = cors_rule.value.allowed_methods
          allowed_origins    = cors_rule.value.allowed_origins
          exposed_headers    = cors_rule.value.exposed_headers
          max_age_in_seconds = cors_rule.value.max_age_in_seconds
        }
      }
      dynamic "delete_retention_policy" {
        for_each = blob_properties.value.delete_retention_policy != null ? [blob_properties.value.delete_retention_policy] : []
        content {
          days                     = delete_retention_policy.value.days
          permanent_delete_enabled = delete_retention_policy.value.permanent_delete_enabled
        }
      }
      dynamic "restore_policy" {
        for_each = blob_properties.value.restore_policy != null ? [blob_properties.value.restore_policy] : []
        content {
          days = restore_policy.value.days
        }

      }
      dynamic "container_delete_retention_policy" {
        for_each = blob_properties.value.container_delete_retention_policy != null ? [blob_properties.value.container_delete_retention_policy] : []
        content {
          days = container_delete_retention_policy.value.days
        }

      }


    }
  }
  dynamic "queue_properties" {
    for_each = var.settings.queue_properties != null ? [var.settings.queue_properties] : []
    content {
      dynamic "cors_rule" {
        for_each = queue_properties.value.cors_rule != null ? [queue_properties.value.cors_rule] : []
        content {
          allowed_headers    = cors_rule.value.allowed_headers
          allowed_methods    = cors_rule.value.allowed_methods
          allowed_origins    = cors_rule.value.allowed_origins
          exposed_headers    = cors_rule.value.exposed_headers
          max_age_in_seconds = cors_rule.value.max_age_in_seconds
        }

      }
      dynamic "logging" {
        for_each = queue_properties.value.logging != null ? [queue_properties.value.logging] : []
        content {
          delete                = logging.value.delete
          read                  = logging.value.read
          version               = logging.value.version
          write                 = logging.value.write
          retention_policy_days = logging.value.retention_policy_days
        }

      }
      dynamic "minute_metrics" {
        for_each = queue_properties.value.minute_metrics != null ? [queue_properties.value.minute_metrics] : []
        content {
          enabled               = minute_metrics.value.enabled
          version               = minute_metrics.value.version
          include_apis          = minute_metrics.value.include_apis
          retention_policy_days = minute_metrics.value.retention_policy_days
        }

      }
      dynamic "hour_metrics" {
        for_each = queue_properties.value.hour_metrics != null ? [queue_properties.value.hour_metrics] : []
        content {
          enabled               = hour_metrics.value.enabled
          version               = hour_metrics.value.version
          include_apis          = hour_metrics.value.include_apis
          retention_policy_days = hour_metrics.value.retention_policy_days
        }

      }

    }

  }
  dynamic "static_website" {

    for_each = var.settings.static_website != null ? [var.settings.static_website] : []
    content {
      index_document     = static_website.value.index_document
      error_404_document = static_website.value.error_404_document
    }

  }
  dynamic "share_properties" {
    for_each = var.settings.share_properties != null ? [var.settings.share_properties] : []
    content {
      dynamic "cors_rule" {
        for_each = share_properties.value.cors_rule != null ? [share_properties.value.cors_rule] : []
        content {
          allowed_headers    = cors_rule.value.allowed_headers
          allowed_methods    = cors_rule.value.allowed_methods
          allowed_origins    = cors_rule.value.allowed_origins
          exposed_headers    = cors_rule.value.exposed_headers
          max_age_in_seconds = cors_rule.value.max_age_in_seconds
        }

      }
      dynamic "retention_policy" {
        for_each = share_properties.value.retention_policy != null ? [share_properties.value.retention_policy] : []
        content {
          days = retention_policy.value.days
        }

      }
      dynamic "smb" {
        for_each = share_properties.value.smb != null ? [share_properties.value.smb] : []
        content {
          versions                        = smb.value.versions
          authentication_types            = smb.value.authentication_types
          kerberos_ticket_encryption_type = smb.value.kerberos_ticket_encryption_type
          channel_encryption_type         = smb.value.channel_encryption_type
          multichannel_enabled            = smb.value.multichannel_enabled

        }

      }
    }

  }


}
