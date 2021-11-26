resource "aws_instance" "sakya" {
ami           = "ami-06a0b4e3b7eb7a300"
instance_type = var.Instance_Type
availability_zone = "ap-south-1a"
key_name = "Terraform"
tags = {
    Name = "Sakya-1"
  }
}

resource "aws_eip" "lb" {
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.sakya.id
  allocation_id = aws_eip.lb.id
}


resource "aws_instance" "sakya_2" {
ami           = data.aws_ami.amzlinux.id
instance_type = var.Instance_Type
availability_zone = "ap-south-1a"
tags = {
    Name = "Sakya-2"
  }
}



resource "aws_instance" "sakya_5" {
  instance_type = var.Instance_Type
  for_each = {
    ap-south-1a = "ami-06a0b4e3b7eb7a300"
    ap-south-1b = "ami-0108d6a82a783b352"
  }
  ami = each.value
  availability_zone = each.key
}


