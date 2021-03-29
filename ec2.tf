provider "aws" {
region = "ap-northeast-2"
 }
 variable "device_name" {default=["/dev/sdd"]}
variable "ec2_ebs_volume_count" {default=1}
resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = aws_instance.myin2.availability_zone
  size = 2
  tags = {
    Name = "myebs1"
  }
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdd"
  volume_id = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.myin2.id
  force_detach = true
} 
resource "aws_instance" "myec2" {
  ami           = "ami-06f3207f56dc1ca18" # us-west-2
  instance_type = "t2.micro"
  tags = {
    "Name" = "mallik-pratice"
  }

}
