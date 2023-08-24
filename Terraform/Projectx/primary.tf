resource "aws_launch_configuration" "primary-launchconfig" {
  name_prefix          = "primary-launchconfig"
  image_id             = lookup(var.AMIS, var.AWS_REGION)
  instance_type        = "t2.medium"
  key_name             = aws_key_pair.prjkey.key_name
  security_groups      = [aws_security_group.primary-securitygroup.id]
  user_data            = "#!/bin/bash\napt-get update\napt-get -y install nginx net-tools stress\nMYIP=`ifconfig | grep 'inet '|grep 'broadcast' | awk '{ print $2 }'`\necho 'Primary is: '$MYIP > /var/www/html/index.html;/tmp/script.sh"
  lifecycle              { create_before_destroy = true }
}

resource "aws_autoscaling_group" "primary-autoscaling" {
  name                 = "primary-autoscaling"
  vpc_zone_identifier  = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  launch_configuration = aws_launch_configuration.primary-launchconfig.name
  min_size             = 1
  max_size             = 2
  health_check_grace_period = 300
  health_check_type = "ELB"
  load_balancers = [aws_elb.primary-elb.name]
  force_delete = true

  tag {
      key = "Name"
      value = "Primary-asc-ec2-instance"
      propagate_at_launch = true
  }
}
