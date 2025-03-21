resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
    tags = {
    Name        = "main-vpc"
    Environment = "dev"
    Project     = "terraform-iac-challenge"
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.main_vpc.id
      tags = {
    Name        = "main-vpc-ig"
    Environment = "dev"
    Project     = "terraform-iac-challenge"
  }

}