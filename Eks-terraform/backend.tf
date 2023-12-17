terraform {
  backend "s3" {
    bucket = "ratmdatastorevishalpoudelnew1" # Replace with your actual S3 bucket name
    key    = "Jenkins2/terraform.tfstate"
    region = "us-east-2"
  }
}
