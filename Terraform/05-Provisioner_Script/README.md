# Info
* 생성된 인스턴스에 script.sh파일을 원격으로 실행시켜 추가 설치하는 예


# 실행 절차
1. 폴더로 이동
```
cd terraform-course/05-Provisioner_Script
```

2. init 및 apply
```
terraform init
terraform apply -auto-approve
```


4. Instance 생성 확인 및 원격스크립트 실행 확인
```
cat terraform.tfstate|grep public_ip
cat script.sh
ssh -i ~/mykey ubuntu@<ip> hostname
curl <ip>
```

6. destroy
```
terraform destroy -auto-approve
aws ec2 delete-key-pair --key-name mykey

```
