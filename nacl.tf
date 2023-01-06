resource "aws_network_acl" "app" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "app"
  }
}

resource "aws_network_acl_association" "app" {
  count = length(aws_subnet.app_subnets.*.id)
  network_acl_id = aws_network_acl.app.id
  subnet_id      = element(aws_subnet.app_subnets.*.id, count.index)
}

resource "aws_network_acl" "db" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "db"
  }
}
resource "aws_network_acl_association" "db" {
  count = length(aws_subnet.app_subnets.*.id)
  network_acl_id = aws_network_acl.db.id
  subnet_id      = element(aws_subnet.db_subnets.*.id, count.index)
}