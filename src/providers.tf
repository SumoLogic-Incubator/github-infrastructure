terraform {
  backend "s3" {
    bucket         = "github-sumologic-incubator-terraform-state"
    dynamodb_table = "github-sumologic-incubator-terraform-state-lock"
    encrypt        = true
    key            = "github-infrastructure/terraform.tfstate"
    region         = "us-east-1"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.18"
    }
  }

  required_version = ">= 1.0.0"
}

provider "github" {
  owner = "SumoLogic-Incubator"
  token = var.github_token
}
