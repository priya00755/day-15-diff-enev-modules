variable "piya" {
    type = bool
    default = false
}


resource "aws_instance" "name" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type = "t3.micro"
    count = var.piya ? 1 : 0
    #if piya is true then create i instance if false then create 0 instance
 
  }