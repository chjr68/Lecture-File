# Info
* VPC/Subnet/Route Table/NatGateway/EIP를 생성하는 예
* 향후 계속 재사용됨


# 실행 절차
1. 폴더로 이동
```
cd terraform-course/10-AwsVpc
```

2. 생성전 확인 사항
* VPC
* Subnets
* Route Table
* Nat GateWay
* EIP

2. init 및 apply
```
terraform init
terraform apply -auto-approve
```


4. 생성 후 확인
* VPC
* Subnets
* Route Table
* Nat GateWay
* EIP


6. destroy
```
terraform destroy -auto-approve

```
