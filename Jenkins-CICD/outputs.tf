output "websiteendpoint" {
    value = aws_s3_bucket.s3storage.website_endpoint
}

output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}