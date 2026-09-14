terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

  # Remote state. Comment this out for your first local run, then come back
  # to it -- understanding why state must be remote and locked is one of the
  # things an interviewer will ask about.
  #
  # backend "azurerm" {
  #   resource_group_name  = "rg-tfstate"
  #   storage_account_name = "sttfstateyourname"
  #   container_name       = "tfstate"
  #   key                  = "site-blueprint.tfstate"
  # }
}

provider "azurerm" {
  features {}
}
