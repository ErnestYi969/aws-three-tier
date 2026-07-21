resource "aws_autoscaling_group" "app" {

  name = "${var.project_name}-asg"


  launch_template {

    id = aws_launch_template.app.id

    version = "$Latest"

  }


  vpc_zone_identifier = [
    aws_subnet.private.id,
    aws_subnet.private_c.id
  ]


  min_size = 1

  max_size = 2

  desired_capacity = 1


  health_check_type = "EC2"


  tag {
    key                 = "Name"
    value               = "${var.project_name}-instance"
    propagate_at_launch = true
  }

}