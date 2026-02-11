resource "aws_instance" "my_server" {
   ami           = data.aws_ami.amazonlinux.id  # Use the AMI ID from the data source
   instance_type = var.instance_type            # Use the instance type from variables
   key_name      = "${var.aws_security_key}"          # Specify the SSH key pair name

   vpc_security_group_ids = [aws_security_group.allow_http_shh.id]
   user_data = templatefile("${path.module}/wp_install.tpl",
   {
    "db_name" : var.db_name,
    "db_username" : var.db_username,
    "db_password" : var.db_password
   })
  
   # Add tags to the EC2 instance for identification
   tags = {
     Name = "my ec2"
   }                  
}