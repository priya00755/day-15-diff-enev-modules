variable "sg" {
    type = map(string)
    default = {
   #key = value
    22    = "203.0.113.0/24"    # SSH (Restrict to office IP)
    80    = "0.0.0.0/0"         # HTTP (Public)
    443   = "0.0.0.0/0"         # HTTPS (Public)
    8080  = "172.31.0.0/16"       # Internal App (Restrict to VPC)
    9000  = "172.31.48.0/20"    # SonarQube/Jenkins (Restrict to VPN)
    3389  = "172.31.16.0/20"
    3000  = "172.31.32.0/20"       #App UI
    }
 }
  
# variable "sgrule" {
#     type = list(string)
#     default = [ "22", "80", "443", "8080", "9000", "3000", "8082", "8081" ]
  
# }
  
resource "aws_security_group" "devops-project-veera" {
  name        = "devops-project-veera-nit"
  description = "Allow TLS inbound traffic"

  

  dynamic "ingress" {
    for_each = var.sg
    content {
      description = "Allow access to port ${ingress.key}"
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
     
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-project-veera-nit"
  }
}