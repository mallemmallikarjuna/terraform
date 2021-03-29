provider "aws" {
region = "ap-northeast-2"
 }
resource "aws_security_group" "morning-ssh-http" {
  name        = "morning-ssh-http"
  description = "allow ssh and http traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "myec2" {
  ami           = "ami-06f3207f56dc1ca18" # us-west-2
  instance_type = "t2.micro"
  security_groups=[ aws_security_group.morning-ssh-http.id ]
  tags = {
    "Name" = "mallik-pratice"
  }

}
