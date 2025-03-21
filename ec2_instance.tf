resource "aws_instance" "web_instance" {
  ami           = "ami-0e56583ebfdfc098f"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public[0].id
  security_groups = [aws_security_group.web_access.id]


      tags = {
    Name        = "web-instance"
    Environment = "dev"
    Project     = "terraform-iac-challenge"
  }

}