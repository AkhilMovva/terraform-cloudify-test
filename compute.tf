resource "aws_instance" "jenkins_server" {
  ami                    = "ami-04505e74c0741db8d" 
  instance_type          = var.instance_type
  key_name               = var.keyname
  vpc_security_group_ids = [aws_security_group.sg_allow_ssh_jenkins.id]
  user_data              = file("install_jenkins.sh")
  tags = {
    "Name" = "Jenkins Server"
  }
}

resource "aws_default_vpc" "default" {
}

# resource "aws_instance" "nginx_server" {
#   ami                    = "ami-033b95fb8079dc481" #linux ami 
#   instance_type          = var.instance_type
#   key_name               = var.keyname
#   vpc_security_group_ids = [aws_security_group.sg_allow_ssh_nginx.id]
#   user_data              = file("metadata.sh")
#   tags = {
#     "Name" = "Nginx Server"
#   }
# }

# resource "aws_instance" "nginx_server" {
#   ami                    = "ami-04505e74c0741db8d" 
#   instance_type          = var.instance_type
#   key_name               = var.keyname
#   vpc_security_group_ids = [aws_security_group.sg_allow_ssh_nginx.id]
#   user_data              = file("install_nginx.sh")
#   tags = {
#     "Name" = "Nginx Server"
#   }
# }

# resource "aws_instance" "mysql_server" {
#   ami                    = "ami-04505e74c0741db8d" #ubuntu
#   instance_type          = var.instance_type
#   key_name               = var.keyname
#   vpc_security_group_ids = [aws_security_group.sg_allow_ssh_mysql.id]
#   # user_data              = file("install_mysql.sh")
#   user_data              = file("install_nginx.sh")
#   tags = {
#     "Name" = "MySql Server"
#   }
# }

resource "aws_security_group" "sg_allow_ssh_jenkins" {
  name        = "sg_ssh_jenkins"
  description = "Allow SSH and Jenkins inbound traffic"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_group_jenkins"
  }
}

# resource "aws_security_group" "sg_allow_ssh_nginx" {
#   name        = "sg_ssh_nginx"
#   description = "Allow SSH and nginx inbound traffic"

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 5000
#     to_port     = 5000
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # outbound from jenkis server
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "security_group_nginx"
#   }
# }

# resource "aws_security_group" "sg_allow_ssh_mysql" {
#   name        = "sg_ssh_mysql"
#   description = "Allow SSH and mysql inbound traffic"

#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # outbound from jenkis server
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "security_group_mysql"
#   }
# }

