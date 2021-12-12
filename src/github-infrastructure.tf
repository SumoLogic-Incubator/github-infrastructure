resource "github_repository" "github_infrastructure" {
  name = "github-infrastructure"

  allow_merge_commit = false
  delete_branch_on_merge = true
  description = "Infrastructure as Code for GitHub org SumoLogic-Incubator"
  has_downloads = false
  has_issues    = true
  has_projects  = false
  has_wiki      = false
  visibility = "public"
}

variable "issue_labels" {
  default = {
    "custom-label"  = "533D99"
    "documentation" = "FFB340"
    "waiting-reply" = "CC6A14"
  }
}

resource "github_issue_label" "github_infrastructure_labels" {
  repository = "${github_repository.github_infrastructure.id}"
  count      = "${length(var.issue_labels)}"
  name       = "${element(keys(var.issue_labels), count.index)}"
  color      = "${element(values(var.issue_labels), count.index)}"
}
