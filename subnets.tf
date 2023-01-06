resource "aws_subnet" "public_subnets" {
  count  = length(var.public_subnet_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.public_subnet_cidr_block, count.index)

  tags = {
    Name = "${var.env}-public-${count.index+1}"
  }
}

resource "aws_subnet" "app_subnets" {
  count  = length(var.app_subnet_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.app_subnet_cidr_block, count.index)

  tags = {
    Name = "${var.env}-app-${count.index+1}"
  }
}
resource "aws_subnet" "db_subnets" {
  count  = length(var.db_subnet_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.db_subnet_cidr_block, count.index)

  tags = {
    Name = "${var.env}-db-${count.index+1}"
  }
}