terraform {
    required_version = ">= 1.11.0"

    backend "s3" {
        bucket = "my-terraform-state-bucket"    # S3 bucket for state storage
        key = "prod/terraform.tfstate"          # State file path in the bucket
        region = var.provider_region            # AWS region
        encrypt = true
        use_lockfile = false
    }
}