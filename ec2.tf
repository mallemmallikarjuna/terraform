provider "aws" {
region = "ap-northeast-2"
  shared_credentials_file = "/root/.aws/credentials"
  profile = "default"
}
resource "aws_instance" "myec2" {
  ami           = "ami-06f3207f56dc1ca18" # us-west-2
  instance_type = "t2.micro"
  tags = {
    "Name" = "arjun-pratice"
  }
}
