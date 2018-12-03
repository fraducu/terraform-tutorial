provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" "this" {}

resource "aws_instance" "frontend" {
  count                  = "${var.number_instances}"
  availability_zone      = "${data.aws_availability_zones.this.names[count.index]}"
  ami                    = "ami-66506c1c"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  timeouts {
    create = "300s"
  }

  lifecycle {
    create_before_destroy = true
  }

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
  }

  provisioner "file" {
    source      = "/Users/Radu/GitHub/terraform-tutorial/3j_Exercise/Frontend/frontend"
    destination = "~/"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x ~/frontend/run_frontend.sh",
      "cd ~/frontend",
      "sudo ~/frontend/run_frontend.sh",
    ]
  }
}
