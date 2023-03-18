terraform {
  backend "s3" {
    bucket = "altschool-exam-backend"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "${var.AWS_REGION}"
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "${var.profile}"
}

variable "cluster_version" {
  default = "1.22"
}
