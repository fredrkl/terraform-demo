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
