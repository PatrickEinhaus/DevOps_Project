terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = "eu-central-1"
}
