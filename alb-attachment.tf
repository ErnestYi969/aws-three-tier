resource "aws_autoscaling_attachment" "app" {

  autoscaling_group_name = aws_autoscaling_group.app.id

  lb_target_group_arn = aws_lb_target_group.app.arn

}

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.app.arn

  port = 80

  protocol = "HTTP"


  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.app.arn

  }

}