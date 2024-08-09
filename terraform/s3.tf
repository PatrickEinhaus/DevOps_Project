resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "tf_state_bucket-${random_id.bucket_id.hex}"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Description = "Bucket for State Locking"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Description = "DynamoDB for State-Locking"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.tf_state_bucket
}

/* initial bucket object for testing
resource "aws_s3_object" "testfile" {
  source = "/home/patrick/test.txt"
  key    = "test.txt"
  bucket = aws_s3_bucket.tf_state_bucket.id
}
*/