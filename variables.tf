variable "ami" {
  default = "ami-04b107e90218672e5"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ports" {
  default = [22, 80, 443, 8080]
}
