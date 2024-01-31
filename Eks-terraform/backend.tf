terraform {
  backend "s3" {
    bucket = "tetrisdemo-project-s3" # Replace with your actual S3 bucket name
    key    = "jenkins/terraform-eks-cluster/terraform.tfstate"
    region = "us-west-2"
  }
}
