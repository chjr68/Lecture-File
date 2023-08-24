# Info
* 인스턴스 생성시 Local 스크립트를 실행하는 예(Attributes를 출력해서 로컬스크립트에서 파일로 저장)
* 원격 접속이 불가능한 간단한 인스턴스 생성함.

# 실행 절차
1. 폴더로 이동
```
cd terraform-course/06-ExecutingScriptLocally
```

2. init 및 apply
```
terraform init
terraform apply -auto-approve
```


4. Instance 생성 확인 및 원격스크립트 실행 확인
```
aws ec2 describe-instance-status --output table

cat private_ips.txt
```

6. destroy
```
terraform destroy -auto-approve

```
