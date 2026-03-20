terraform {
  backend "s3" {
    bucket = "piya-s3-tf-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
