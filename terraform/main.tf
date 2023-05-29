terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
  cloud {
    organization = "fredrkl"
    workspaces {
      name = "learn-terraform-azure"
    }
  }
  required_version = ">= 1.1.0"
}

provider "github" {
  app_auth {}
}

provider "azurerm" {
  features {}
}

module "gitrepo" {

  providers = {
    github = github
  }

  source = "./modules/git-repo"

  for_each = var.repos

  repo = {
    name = each.value.name
    description = each.value.description
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westus2"

  tags = {
    Environment = "Terraform Demo"
    Team        = "DevOps"
  }
}

module "network" {
  source = "./modules/network"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

}

resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
