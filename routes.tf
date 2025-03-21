resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main_vpc.id
        tags = {
    Name        = "main-vpc-rt-public"
    Environment = "dev"
    Project     = "terraform-iac-challenge"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gw.id

}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main_vpc.id
          tags = {
    Name        = "main-vpc-rt-private"
    Environment = "dev"
    Project     = "terraform-iac-challenge"
  }
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id

}