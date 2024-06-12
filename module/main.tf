resource "aws_security_group" "allow_tls" {
  name        = var.name
  description =  "Description - ${var.name}-${var.env}"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  #Application port
  ingress {
    from_port        = var.port_no
    to_port          = var.port_no
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
resource "aws_instance" "node" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.name
  }

}
resource "aws_route53_record" "record" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.name}.vikramdevops.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.node.public_ip]
}


