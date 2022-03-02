variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     = "ec2_ssh1"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     = "t2.micro"
}

variable "keyname" {
  default = "ec2_ssh1"
}