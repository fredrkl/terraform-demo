output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "repo_urls" {
  description = "value of the repo_urls output variable"
  value = { for repo in keys(var.repos): repo => module.gitrepo[repo].repo_url }
}
