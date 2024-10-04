
resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  instance_market_options {
    market_type = "spot"
    spot_options {
      spot_instance_type             = "persistent"
      instance_interruption_behavior = "stop"
    }
  }
  tags = {
    Name = "${var.component}-${var.env}"
  }
}

resource "aws_route53_record" "hostzone" {
  name    = "${var.component}-${var.env}"
  type    = var.route_record_type
  zone_id = var.zone_id
  records = [aws_instance.instance.private_ip]
  ttl = 300
}
