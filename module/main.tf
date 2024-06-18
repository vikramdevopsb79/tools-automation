resource "aws_security_group" "allow_tls" {
  name        = var.name
  description =  "Description - ${var.name}"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
resource "aws_security_group_rule" "app-ports" {
  count             = length(var.port_no)
  from_port         = element(var.port_no, count.index)
  protocol          = "tcp"
  security_group_id = aws_security_group.allow_tls.id
  to_port           = element(var.port_no, count.index)
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_instance" "node" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  #attaching policy  i am role to ec2
  iam_instance_profile   = aws_iam_instance_profile.main.name
  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior  = "stop"
      spot_instance_type              = "persistent"
    }
  }
  tags = {
    Name = var.name
  }

}
resource "aws_route53_record" "record" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.name}.vikramdevops.tech"
  type    = "A"
  ttl     = 3
  records = [aws_instance.node.public_ip]
}
resource "aws_route53_record" "private" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.name}-internal.vikramdevops.tech"
  type    = "A"
  ttl     = 5
  records = [aws_instance.node.private_ip]
}

