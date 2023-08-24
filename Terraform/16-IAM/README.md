# Info
* 유저 및 유저 그룹 생성예

# 실행 절차
1. 폴더로 이동
```
cd terraform-course/
```

2. 실행전 확인
* AWS Console→AIM Dashboard에서 현재 상태 확인 : https://console.aws.amazon.com/iam/

3. init 및 apply
```
terraform init
terraform apply -auto-approve
```

4. 실행후 확인
* AWS Console→AIM Dashboard에서 현재 상태 확인 : https://console.aws.amazon.com/iam/

5. destroy
```
terraform destroy -auto-approve
```
