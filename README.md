#
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.53.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | github.com/schubergphilis/terraform-azure-mcaf-storage-account.git | v0.7.2 |

## Resources

| Name | Type |
|------|------|
| [azurerm_application_insights.appr_appi](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_eventhub.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_eventhub_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_authorization_rule) | resource |
| [azurerm_eventhub_consumer_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_consumer_group) | resource |
| [azurerm_eventhub_namespace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |
| [azurerm_eventhub_namespace_authorization_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_authorization_rule) | resource |
| [azurerm_eventhub_namespace_customer_managed_key.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_customer_managed_key) | resource |
| [azurerm_linux_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app) | resource |
| [azurerm_role_assignment.ehns_datadog_mid](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.func_datadog_mid_eventhub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.func_datadog_mid_keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.func_datadog_mid_sta_blob](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.func_datadog_mid_sta_file](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.func_datadog_mid_sta_queue](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.func_datadog_mid_sta_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.security_provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sta_datadog_mid](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_user_assigned_identity.ehns_datadog_mid](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_user_assigned_identity.func_datadog_mid](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_user_assigned_identity.sta_datadog_mid](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_key.cmk_encryption_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_key) | data source |
| [azurerm_key_vault_secret.datadog_api_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.datadog_site](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_insights_name"></a> [application\_insights\_name](#input\_application\_insights\_name) | The name of the Application Insights to be deployed | `string` | n/a | yes |
| <a name="input_ddog_storage_containers"></a> [ddog\_storage\_containers](#input\_ddog\_storage\_containers) | Blob Containers to be created in the Storage Account | `set(string)` | n/a | yes |
| <a name="input_event_hub"></a> [event\_hub](#input\_event\_hub) | The properties of the Event Hub to be deployed | <pre>object({<br/>    namespace_name     = string<br/>    sku                = optional(string, "Premium")<br/>    capacity           = optional(number, 2)<br/>    hub_name           = string<br/>    authorization_rule = string<br/>    consumer_group     = string<br/>  })</pre> | n/a | yes |
| <a name="input_event_hub_authorization_rules"></a> [event\_hub\_authorization\_rules](#input\_event\_hub\_authorization\_rules) | Event Hub authorization rules | <pre>map(<br/>    object({<br/>      listen = bool<br/>      send   = bool<br/>      manage = bool<br/>    })<br/>  )</pre> | n/a | yes |
| <a name="input_event_hub_consumer_groups"></a> [event\_hub\_consumer\_groups](#input\_event\_hub\_consumer\_groups) | Event Hub consumer groups | `set(string)` | n/a | yes |
| <a name="input_event_hub_namespace"></a> [event\_hub\_namespace](#input\_event\_hub\_namespace) | The properties of the Event Hub Namespace to be deployed | <pre>object({<br/>    diagnostics_policy_authorization_rule_name = string<br/>  })</pre> | n/a | yes |
| <a name="input_function_app"></a> [function\_app](#input\_function\_app) | The parameters to be used for the Function App deployment. Inludes the ID of the App Service Plan to be used and the ID of the subent for regional VNET integration | <pre>object({<br/>    service_plan_id = string<br/>    vnet_subnet_id  = string<br/>  })</pre> | n/a | yes |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | The name of the Function App to be deployed | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the deployed Resources | `string` | n/a | yes |
| <a name="input_managed_identity_name"></a> [managed\_identity\_name](#input\_managed\_identity\_name) | The name of the Managed Identity to be deployed | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Resource Group that will be used the deployment | `string` | n/a | yes |
| <a name="input_key_vault"></a> [key\_vault](#input\_key\_vault) | The properties of the Key Vault to be used to store secrets | <pre>object({<br/>    name                = string<br/>    resource_group_name = string<br/>  })</pre> | `null` | no |
| <a name="input_key_vault_secret_cmk_key_name"></a> [key\_vault\_secret\_cmk\_key\_name](#input\_key\_vault\_secret\_cmk\_key\_name) | n/a | `string` | `"cmkrsa"` | no |
| <a name="input_key_vault_secret_datadog_apikey_name"></a> [key\_vault\_secret\_datadog\_apikey\_name](#input\_key\_vault\_secret\_datadog\_apikey\_name) | The name of the Key Vault secret containing the DataDog API key | `string` | `"datadog-api-key"` | no |
| <a name="input_key_vault_secret_datadog_site_name"></a> [key\_vault\_secret\_datadog\_site\_name](#input\_key\_vault\_secret\_datadog\_site\_name) | The name of the Key Vault secret containing the DataDog Site (host) | `string` | `"datadog-site"` | no |
| <a name="input_storage_account"></a> [storage\_account](#input\_storage\_account) | The configuration of the Storage Account to be deployed as storage for the Function App | <pre>object({<br/>    name                              = string<br/>    public_network_access_enabled     = optional(bool, false)<br/>    account_tier                      = optional(string, "Standard")<br/>    account_replication_type          = optional(string, "ZRS")<br/>    access_tier                       = optional(string, "Hot")<br/>    log_retention_days                = optional(number, null)<br/>    move_to_cold_after_days           = optional(number, null)<br/>    move_to_archive_after_days        = optional(number, null)<br/>    snapshot_retention_days           = optional(number, 90)<br/>    infrastructure_encryption_enabled = optional(bool, true)<br/>    cmk_key_vault_id                  = optional(string, null)<br/>    cmk_key_name                      = optional(string, "cmkrsa")<br/>    system_assigned_identity_enabled  = optional(bool, false)<br/>    user_assigned_identities          = optional(list(string), [])<br/>    enable_law_data_export            = optional(bool, false)<br/>    immutability_policy = optional(object({<br/>      state                         = optional(string, "Unlocked")<br/>      allow_protected_append_writes = optional(bool, true)<br/>      period_since_creation_in_days = optional(number, 14)<br/>    }), null)<br/>  })</pre> | `null` | no |
| <a name="input_support_defender_export"></a> [support\_defender\_export](#input\_support\_defender\_export) | Feature flag allowing operators to enable support For Defender's Coninuous Export | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventhub_namespace_id"></a> [eventhub\_namespace\_id](#output\_eventhub\_namespace\_id) | n/a |
| <a name="output_function_app_id"></a> [function\_app\_id](#output\_function\_app\_id) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
<!-- END_TF_DOCS -->