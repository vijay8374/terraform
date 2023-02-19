variable "region"{
  default ="ap-south-1"

}



variable "instance_type"{
 default = "t2.micro"

}

variable "webserver-port"{
 default = [22, 80]

}

variable "cidr-blocks"{
 default ="0.0.0.0/0"

}
variable "custom_tags"{
   type = map
   default = {
    Name = "webserver"
    env = "dev"
   }

}
 variable "user_name"{
 type = list(string)
 default = ["bhavani","karthik","vijay"]
 }
