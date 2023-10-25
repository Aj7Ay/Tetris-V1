terraform {
  backend "s3" {
    bucket = "ajay-mrcloudbook777" # Replace with your actual S3 bucket name
    key    = "Jenkins/terraform.tfstate"
    region = "ap-south-1"
  }
}
