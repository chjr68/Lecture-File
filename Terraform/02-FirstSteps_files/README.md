
# Info
* Terraform 명령을 여러 파일에 위치 시킬 수 있고 쉘 변수와 Terraform변수가 연동 될 수 있다는 것을 보여주는 예제임. 생성된 인스턴스에 접속이 되는 것은 아님.

# 주의
* terraform.tfvars  사용시, 보안을 위해 terraform.tfvars를  .gitignore에 포함 시킬 것.

# 실행 절차
0. 변수 셋팅 파일 생성 후 실행
```
vi ~/.bashrc
#export TF_VAR_AWS_ACCESS_KEY="xxxxxxx"
#export TF_VAR_AWS_SECRET_KEY="xxxxxxxxxxxxxxx"
#export TF_VAR_AWS_REGION="eu-west-1"

bash ~/.bashrc
```

1. 해당 폴더로 이동
```
cd terraform-course/02-FirstSteps_files
cp -r ../.terraform ./       # 필수 아님
```
2. 변수 셋팅 파일 생성 후 실행
```
vi ~/keySetting.sh
#export TF_VAR_AWS_ACCESS_KEY="xxxxxxx"
#export TF_VAR_AWS_SECRET_KEY="xxxxxxxxxxxxxxx"
#export TF_VAR_AWS_REGION="eu-west-1"

bash keySetting.sh
```
cf) 다시 로그인해도 적용되게 하기.
```
cat keySetting.sh >> ~/.bashrc
```

3. init
```
terraform init
```

4. apply : 중간에 Yes입력
```
terraform apply
```

5. Instance 생성 확인

6. destroy
```
terraform destroy
```
