variable "aws_security_key" {
    type = string
    sensitive = true
}

variable "db_username" {
    type = string
    sensitive = true
}

variable "db_password" {
    type = string
    sensitive = true
}

variable "db_name" {
    type = string
    default = "wordpressdb"
}

variable "provider_region" {
    type = string
    default = "us-east-2"
}