terraform {
  backend "s3" {
    bucket = "vikramdevopsbucket1"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}