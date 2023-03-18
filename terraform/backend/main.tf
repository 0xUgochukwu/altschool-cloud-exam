module "s3" {
  source = "terraform-aws-modules/s3-bucket/aws"


  bucket = var.bucket_name

}

resource "aws_s3_bucket" "temp" {
  bucket = var.bucket_name
  acl    = "private"
  versioning {
    enabled = true
  }

  tags = {
    Name = var.bucket_name
  }

}