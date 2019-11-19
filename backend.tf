terraform {
  backend "s3" {
    bucket = "tfstates-bucket"
    key    = "eks/terraform.tfstate"
    region = "ap-south-1"
  }
}
