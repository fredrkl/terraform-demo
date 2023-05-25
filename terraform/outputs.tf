output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "repo_urls" {
  description = "value of the repo_urls output variable"
  value = { for key in keys(var.repos): key => module.gitrepo[key].repo_url }
}
