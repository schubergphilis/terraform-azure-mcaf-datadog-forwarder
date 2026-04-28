terraform {
  required_version = ">= 1.8"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.58"
    }
    datadog = {
      source  = "datadog/datadog"
      version = "~> 4.0"
    }
  }
}
