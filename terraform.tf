terraform {
    backend "s3" {
        bucket = "my-terraform-state-bucket"    # S3 bucket for state storage
        key = "prod/terraform.tfstate"          # State file path in the bucket
        region = "us-east-2"                    # AWS region
        encrypt = true
    }
}