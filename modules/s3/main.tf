resource "aws_s3_bucket" "my_s3" {
  bucket = "my-s3-bucket"
  acl    = var.acl
  count  = var.create ? 1 : 0
  versioning {
    enabled = var.enabled
  }
  lifecycle_rule {
    enabled = var.lifecycle_enabled

    noncurrent_version_transition {
      days          = var.days
      storage_class = var.storage_class
    }
    noncurrent_version_transition {
      days          = var.days_after_above_transition
      storage_class = var.storage_class_afterend_of_aboveperiod
    }
  }

  tags = {
    Name        = "My-bucket"
    Environment = terraform.workspace
  }
}
