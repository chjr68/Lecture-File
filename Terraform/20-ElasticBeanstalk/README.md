# Info
* ElasticBeanstalk를 이용하여 PaaS서비스 구현예.

# 실행 절차
1. 폴더로 이동
```
cd terraform-course/20-ElasticBeanstalk
```

2. init 및 apply
* 파일 수정
  - rds.tf에서 "aws_db_subnet_group" "mariadb-subnet"의 Name을 unique하게 바꾸거나 RDS의 Subnet Group 제거
  - rds.tf에서 "aws_db_parameter_group" "mariadb-parameters" 의 Name을 unique하게 바꾸거나 RDS의 Parameter Group 제거
  - aws elasticbeanstalk list-available-solution-stacks|grep PHP
        → 찾아서 elasticbeanstalk.tf의 solution_stack_name수정

```
terraform init
terraform apply -auto-approve  -var RDS_PASSWORD=sds12gkn
```


3. Instance 생성 확인
```
terraform output
```
* 브라우저에서 위 주소로 접속

4. Source Code update
* Elastic Beanstalk Command Line Interface (EB CLI)
  - Source Code folk 뜨세요. : https://github.com/wardviaene/eb-php-example
```
cd ../../
git clone https://github.com/Finfra/eb-php-example.git
cd eb-php-example/
vi index.php             # commit되라고,
eb init
(4,1)
eb deploy
(기다릴것.)
브라우저에서 해당 주소로 다시 접속.
```


5. destroy
```
terraform destroy -auto-approve  -var RDS_PASSWORD=sds12gkn
aws ec2 delete-key-pair --key-name mykey

```
