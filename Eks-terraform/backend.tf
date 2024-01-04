terraform {
  backend "s3" {
    bucket = "eks-tfstate-1" # Replace with your actual S3 bucket name
    key    = "Jenkins/terraform.tfstate"
    region = "ap-sout-1"
  }
}
