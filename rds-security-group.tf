resource "aws_security_group" "rds" {

  name = "${var.project_name}-rds-sg"

  vpc_id = aws_vpc.main.id


  ingress {

    description = "MySQL from EC2"

    from_port = 3306

    to_port = 3306

    protocol = "tcp"

    security_groups = [
      aws_security_group.ec2.id
    ]

  }


  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }


  tags = {

    Name = "${var.project_name}-rds-sg"

  }

}