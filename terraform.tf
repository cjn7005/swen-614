terraform {
    backend "s3" {
        bucket = "swen614-cjn7005-mybucket"    # S3 bucket for state storage
        key = "cjn7005/terraform.tfstate"          # State file path in the bucket
        region = "us-east-2"                    # AWS region
        encrypt = true
    }
}