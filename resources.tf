resource "aws_instance" "webserver" {
count = length(var.user_name)
  ami           = data.aws_ami.aws_linux_2_latest.id
  instance_type = var.instance_type
user_data =file("./scripts/httpd.sh")
vpc_security_group_ids = [aws_security_group.webserver_sg.id]

    tags = {
    Name = "${var.custom_tags["Name"]}-${var.user_name[count.index]}"
    env =  var.custom_tags["env"]

    }
}

 data "aws_ami" "aws_linux_2_latest" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}




      resource "aws_security_group" "webserver_sg" {
        name        = "webserver SG"
        description = "Allow TLS inbound traffic"

        dynamic "ingress" {
        iterator = port
        for_each = var.webserver-port
        content {
          from_port = port.value
          to_port   = port.value
          protocol = "tcp"
          cidr_blocks = [var.cidr-blocks]
        }
      }
        egress {
          from_port        = 0
          to_port          = 0
          protocol         = "-1"
          cidr_blocks      = [var.cidr-blocks]
          ipv6_cidr_blocks = ["::/0"]

        }

        tags = {
          Name = "webserver_sg"

        }
}
