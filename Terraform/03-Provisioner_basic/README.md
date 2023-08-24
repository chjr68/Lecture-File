# Info
* 로그인 가능한 인스턴스 만들기


# 주의
* aws 명령을 실행시 "aws configure" 셋팅 필수

# 실행 절차
1. aws configure하고 해당 폴더로 이동
```
aws configure

cd terraform-course/03-Provisioner_basic
```

2. 변수 셋팅 파일 생성 후 실행
```
cp -r ../.terraform ./
```

3. ssh key생성 및 init
```
ssh-keygen -f ~/mykey
terraform init
```

4. apply : -auto-approve 하면 중간에 Yes입력 안해도 됨.
```
terraform apply -auto-approve
```

5. Instance 생성 확인
* 주의) Default securitygroup 확인 필수
```
cat terraform.tfstate|grep public_ip
aws ec2 describe-instance-status --output table # aws configure 실행시만

ssh -i ~/mykey ubuntu@<ip>

```

6. destroy
```
terraform destroy -auto-approve
```
