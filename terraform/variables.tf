variable "resource_group_name" {
  type    = string
  default = "myTFResourceGroup"
}

variable "GITHUB_OWNER" {
  type    = string
}

variable "GITHUB_APP_INSTALLATION_ID" {
  type    = string
}

variable "ARM_TENANT_ID" {
  type = string
}  

variable "ARM_CLIENT_ID" {
  type = string
}

variable "GITHUB_APP_PEM_FILE" {
  type = string 
}

variable "GITHUB_APP_ID" {
  type = string
}

variable "ARM_SUBSCRIPTION_ID" {
  type = string
}

variable "ARM_CLIENT_SECRET" {
  type = string
}

variable "repos" {
  description = "List of repos"
  type = map(object({
    name = string
    description = string
  }))

  default = {
    first-terraform-repo = {
      name = "first-terraform-repo"
      description = "This is my first terraform repo"
    }
    second-terraform-repo = {
      name = "second-terraform-repo"
      description = "This is my second terraform repo"
    }
  }
}
