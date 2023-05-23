output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "repo_url" {
  value = module.gitrepo.repo_url
}
