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

  repo = {
    name = "first-terraform-repo"
    description = "This is my first terraform repo"
  }
}

module "gitrepo-second" {

  providers = {
    github = github
  }
  
  source = "./modules/git-repo"

  repo = {
    name = "second-terraform-repo"
    description = "This is my second terraform repo"
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

resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
