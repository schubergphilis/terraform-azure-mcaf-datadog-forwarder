terraform {
  required_version = ">= 1.8"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.53.1"
    }
    datadog = {
      source  = "datadog/datadog"
      version = ">= 3.0.0"
    }
  }
}

module "datadog_forwarder" {
  source = "../../"

  location            = "West Europe"
  resource_group_name = "example-datadogforwarder-rg"
  tags = {
    Environment = "Test"
    Service     = "DataDog"
  }

  function_app_name         = "example-datadog-function"
  application_insights_name = "example-datadog-insights"
  managed_identity_name     = "datadog-mid"

  log_analytics_workspace_id = "/resource/path/to/log-analytics-workspace"

  event_hub = {
    namespace_name     = "example-datadog-evhns"
    hub_name           = "example-datadog-evh"
    authorization_rule = "datadog-auth"
    consumer_group     = "datadog-consumer"
    sku                = "Premium"
    capacity           = 2
  }

  event_hub_namespace = {
    diagnostics_policy_authorization_rule_name = "diagnostics-policy"
  }

  # Function App configuration
  function_app = {
    service_plan_id = "Resource ID of the App Service Plan"
    vnet_subnet_id  = "Resource ID of the VNET Subnet for regional VNET integration"
  }

  key_vault = {
    name                = "Resource ID of the Key Vault"
    resource_group_name = "example-keyvault-rg"
  }

  storage_account = {
    name                          = "storageaccountname"
    public_network_access_enabled = false
    account_tier                  = "Standard"
    account_replication_type      = "ZRS"
    cmk_key_vault_id              = "Resource ID of the Key Vault for containing the CMK"
  }

  ddog_storage_containers = ["storagecontainername"]
  event_hub_authorization_rules = {
    sender = {
      listen = false
      send   = true
      manage = false
    }
    receiver = {
      listen = true
      send   = false
      manage = false
    }
  }
  event_hub_consumer_groups = ["consumer1", "fnc"]
  support_defender_export   = true
}
