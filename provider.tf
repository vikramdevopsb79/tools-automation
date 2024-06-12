terraform {
  backend "s3" {
    bucket = "vikramdevopsbucket"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}