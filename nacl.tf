resource "aws_network_acl" "app" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 9999
    action     = "allow"
    cidr_block = var.workstation_ip
    from_port  = 22
    to_port    = 22
  }
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

  egress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "db"
  }
}
resource "aws_network_acl_association" "db" {
  count = length(aws_subnet.app_subnets.*.id)
  network_acl_id = aws_network_acl.db.id
  subnet_id      = element(aws_subnet.db_subnets.*.id, count.index)
}