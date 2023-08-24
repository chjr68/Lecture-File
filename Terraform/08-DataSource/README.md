# Info
* Data Sources : VPC의 'from_eu_west'라는 Security Groups 추가(inbound setting)
* 해당 지역에 대한 모든 접근을 허용하려면 일일이 cidr_blocks을 Security Group에 지정해 주어야 함.
  --> Terraform의 DataSource를 통해 Aws로 해당 CIDR값들을 받아서 Securtiy Group을 생성할 수 있음.
* Manual :  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ip_ranges

# 실행 절차
1. 폴더로 이동
```
cd terraform-course/08-DataSource
```

2. 현재 'from_eu_west'라는  Security Groups이 없다는 것을 확인
```
aws ec2 delete-security-group --group-name from_eu_west
```


3. init 및 apply
```
terraform init
terraform apply -auto-approve
```


4. 'from_eu_west'라는  Security Groups이 생성 되었음을 확인
* EC2 console의 Security Groups의 Inbound 셋팅에서도 확인 가능.
```
aws ec2 delete-security-group --group-name from_eu_west
```

6. destroy
```
terraform destroy -auto-approve
```
