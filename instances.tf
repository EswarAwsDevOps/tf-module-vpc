resource "aws_instance" "public" {
  ami = "ami-0a017d8ceb274537d"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public_subnets.*.id[0]
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "public"
  }
}
resource "aws_instance" "app" {
  ami = "ami-0a017d8ceb274537d"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.app_subnets.*.id[0]
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "app"
  }
}
resource "aws_instance" "db" {
  ami = "ami-0a017d8ceb274537d"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.db_subnets.*.id[0]
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "db"
  }
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "aws_vpc.main.id"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}




