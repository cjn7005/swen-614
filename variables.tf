# Variable definition for EC2 instance type
variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"  # Default to t2.micro if no value is provided
}

variable "provider_region" {
    type = string
    default = "us-east-2"
}

variable "db_name" {
    type = string
    default = "blog"
}

variable "db_username" {
    type = string
    sensitive = true
}

variable "db_password" {
    type = string
    sensitive = true
}

variable "aws_security_key" {
    type = string
    sensitive = true
}

variable "vpc_id" {
    type = string
    default = "vpc-045ea0b66c37bcc9a"
}