resource "aws_elb" "bar" {
  name               = "foobar-terraform-elb"
  availability_zones = var.List-1
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
