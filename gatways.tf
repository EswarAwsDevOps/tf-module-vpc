resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}_igw"
  }
}

resource "aws_eip" "ngw" {}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = aws_subnet.public_subnets.*.id[0]

  tags = {
    Name = "${var.env}_natGW"
  }
}