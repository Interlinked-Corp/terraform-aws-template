terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "il01-terraform-states"
    key    = "il01/service/staging/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}

module "service" {
  source = "../../modules/service"
  infra_env = "stg"
}
