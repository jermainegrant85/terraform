resource "aws_subnet" "public" {
  count                   = length(var.subnets_public)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnets_public[count.index]
  map_public_ip_on_launch = true
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name        = "subnet-public-${count.index + 1}"
    Environment = "dev"
    Project     = "terraform-iac-challenge"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.subnets_private)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnets_private[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name        = "subnet-private-${count.index + 1}"
    Environment = "dev"
    Project     = "terraform-iac-challenge"
  }
}

data "aws_availability_zones" "available" {}