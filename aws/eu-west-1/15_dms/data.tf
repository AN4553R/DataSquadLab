data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_availability_zones" "available" {}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "datasquad-terraform-state-backend"
    key    = "00_foundations/terraform.tfstate"
    region = "eu-west-1"
  }
}
data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket = "datasquad-terraform-state-backend"
    key    = "04_rds/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    bucket = "datasquad-terraform-state-backend"
    key    = "02_s3/terraform.tfstate"
    region = "eu-west-1"
  }
}