# Info
* Autoscaling 구현예

# 실행 절차
1. 폴더로 이동
```
cd terraform-course/18-Autoscaling
whoami
```

2. init 및 apply
```
terraform init
terraform apply -auto-approve
```

3. Instance 생성 확인 및 Autoscaling 작동 여부 확인
* apply후 ec2 → Auto Scaling Goup에서 확인(모니터링탭)
  - Auto Scaling group metrics collection: Enable
* Service → cloudWatch에서 Alarms 그래프 확인 : https://eu-west-1.console.aws.amazon.com/cloudwatch/home?region=eu-west-1
* Aws Console의 Ec2 instance에서 해당 Instance의 ip 혹은 url 확인
```
aws ec2 describe-instance-status --output table

ssh -i ~/mykey ubuntu@<url>
  sudo apt update -y
  sudo apt install -y stress
  stress --cpu 2 --timeout 300
```
* 다른 창에서 Instance 자동 추가되었는지 확인
```
aws ec2 describe-instance-status --output table
```

* stress 툴에 의한 과도한  CPU사용이 끝난 후에 instance 갯수가 원복 되었는지 확인

4. destroy
```
terraform destroy -auto-approve
aws ec2 delete-key-pair --key-name mykey
```
