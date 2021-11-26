terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.66.0"
    }
  }
  backend "s3" {
  bucket = "sakya"
  key    = "terraform-state/terraform.tfstate"
    region = "us-east-1"
  }
    }

provider "aws" {
  region = "ap-south-1"
}
