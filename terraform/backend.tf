# Backend Configuration
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraform/state"
    dynamodb_table = "terraform-lock"
    encrypt        = true
    
  }
}