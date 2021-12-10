resource "github_repository" "github_infrastructure" {
  name = "github-infrastructure"

  has_downloads = false
  has_issues    = true
  has_projects  = false
  has_wiki      = false
}
