# configure remote state storage
terraform {
  backend "s3" {
    bucket = "peregin-terraform"
    key    = "infra/terraform.tfstate"
    region = "us-east-1"
  }
}
