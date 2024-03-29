variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "ports" {
  type    = list(number)
  default = [22,80,8080]
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

output "public_ip" {
  value = aws_instance.VM_Server.public_ip
}
