#security group

resource "aws_security_group" "sg-tf_5" {
  name        = "first-sg_5"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = "${var.ports}"
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = "${var.ports}"
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "TF-sg_5"
  }
}
