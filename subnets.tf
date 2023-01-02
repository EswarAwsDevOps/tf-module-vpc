resource "aws_subnet" "public_subnets" {
  count  = length(var.public_subnet_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.public_subnet_cidr_block, count.index)

  tags = {
    Name = "${var.env}-public-${count.index+1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count  = length(var.private_subnet_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.private_subnet_cidr_block, count.index)

  tags = {
    Name = "${var.env}-private-${count.index+1}"
  }
}