resource "aws_s3_bucket" "s3storage" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket_ownership_controls" "s3storage" {
  bucket = aws_s3_bucket.s3storage.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3storage" {
  bucket = aws_s3_bucket.s3storage.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3storage" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3storage,
    aws_s3_bucket_public_access_block.s3storage,
  ]
  bucket = aws_s3_bucket.s3storage.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.s3storage
  key    = "index.html"
  source = "index.html"
  acl    = "public-read"
  content_type = "text/html"
}


resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.s3storage
  key    = "error.html"
  source = "error.html"
  acl    = "public-read"
  content_type = "text/html"
}


resource "aws_s3_object" "style" {
  bucket = aws_s3_bucket.s3storage.id
  key    = "style.css"
  source = "style.css"
  acl    = "public-read"
  content_type = "text/css"
}


resource "aws_s3_object" "script" {
  bucket = aws_s3_bucket.s3storage.id
  key    = "script.js"
  source = "script.js"
  acl    = "public-read"
  content_type = "text/javascript"
}


resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.s3storage.id
  index_document {
    suffix = "index.html"
  }

    error_document {
      key = "error.html"
    }

    depends_on = [aws_s3_bucket_acl.s3storage.id]
}

