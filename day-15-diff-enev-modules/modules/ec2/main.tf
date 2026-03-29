resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = t3.micro
  subnet_id     = var.subnet_id
  #key_name = var.key_name
  tags = {
    Name = "${var.env}-ec2"
  }
}

# In the above code use ec2 module instead of resource block