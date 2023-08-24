# Info
* ELB를 구현하고 Load Balancer가 작동하는지 확인하는 예

# 실행 절차
1. 폴더로 이동
```
cd terraform-course/19-AutoscalingWithELB
```

2. init 및 apply
```
terraform init
terraform apply -auto-approve
```


3. ELB 확인
* 코드에서 바뀐점.
```
  "aws_autoscaling_group" "example-autoscaling" →  health_check_type = "ELB"
      load_balancers = ["${aws_elb.my-elb.name}"]
  "aws_launch_configuration" "example-launchconfig" → user_data, lifecycle
```
* 확인 예
  - Aws Console의 Ec2 instance에서 해당 Instance의 ip 혹은 url 확인
```

ssh -i ~/mykey ubuntu@$<url>
  # 인스턴스 아무거나에 접속해서
  sudo -i
  echo "$(hostname)">/var/www/html/index.html
  exit
  exit
cat terraform.tfstate|grep dns_name # elb의 URL확인
curl my-elb-xxxxx.eu-west-1.elb.amazonaws.com  # 여러번하면 다른 IP보임
```
* Aws Console의 Ec2 instance에서 Load Balancers에서 확인 가능

4. destroy
```
terraform destroy -auto-approve
aws ec2 delete-key-pair --key-name mykey

```
