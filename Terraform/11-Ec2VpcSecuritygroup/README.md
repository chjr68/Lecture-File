# Info
* VPC와 관련 Infra를 생성하고 해당 Zone에 Instance를 배치하는 예

# 실행 절차
1. 폴더로 이동
```
cd terraform-course/11-Ec2VpcSecuritygroup
```
2. 생성전 확인 사항
* VPC
* Subnets
* Route Table


3. init 및 apply
```
terraform init
terraform apply -auto-approve
```


4. Apply 후 VPC 관련 사항 확인 및 Instance 생성 확인
* VPC
* Subnets
* Route Table
* 생성된 instance의 VPC,Subnet,Security Group 및
* 생성된 instance에서 사용하는 Security Group allow-ssh의 내역 확인
```
cat terraform.tfstate|grep public_ip
ssh -i ~/mykey ubuntu@<ip> hostname
```

5. destroy
```
terraform destroy -auto-approve
aws ec2 delete-key-pair --key-name mykey
```
