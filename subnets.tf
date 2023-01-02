resource "aws_subnet" "subnets" {
  count  = length(var.subnet_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.subnet_cidr_block, count.index)

  tags = {
    Name = "${var.env}-subnet-${count.index}"
  }
}