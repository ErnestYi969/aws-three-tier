resource "aws_launch_template" "app" {

  name_prefix = "${var.project_name}-"

  image_id = "ami-0aae00de4a3cf9639"

  instance_type = "t3.micro"


  iam_instance_profile {
    name = aws_iam_instance_profile.ec2.name
  }


  vpc_security_group_ids = [
    aws_security_group.ec2.id
  ]


  user_data = base64encode(<<-EOF
              #!/bin/bash

              dnf update -y

              dnf install nginx -y

              systemctl start nginx

              systemctl enable nginx

              echo "Hello from Terraform EC2" > /usr/share/nginx/html/index.html

              EOF
  )


  tag_specifications {

    resource_type = "instance"

    tags = {
      Name = "${var.project_name}-app"
    }
  }
}