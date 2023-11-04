resource "aws_key_pair" "key-tf" {
  key_name   = "fifth-key"
  public_key = file("${path.module}/aws.pub")
}


resource "aws_instance" "fifth-instance-tf" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = "fifth-key"
  security_groups = ["first-sg_5"]
  tags = {
    Name = "fifth_ec2_tf"
  }


  connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("${path.module}/aws.pri")
        host        = self.public_ip
  }
  provisioner "file" {
    source      = "/home/ubuntu/provisioners/file1"
    destination = "/home/ubuntu/file1"  
  }

  provisioner "file" {
      source = "/home/ubuntu/provisioners/file2"
      destination = "/home/ubuntu/file2"
  }
}
