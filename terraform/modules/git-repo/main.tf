terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

resource "github_repository" "repo" {
  name        = var.git_repo_name
  description = var.git_repo_description
  visibility  = "public"
  has_wiki = false

  template {
    owner = "fredrkl"
    repository = "template-demo"
  }

  topics = [
    "terraform"
  ]
}
