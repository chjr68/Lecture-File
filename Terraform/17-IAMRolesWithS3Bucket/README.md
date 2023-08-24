# Info
* IAM의 Role과 Policy등을 만들고 S3 버킷에 적용하는 예

# 실행 절차
1. 폴더로 이동
```
cd terraform-course/17-IAMRolesWithS3Bucket
```

2. init 및 apply
* IAM에서 IAMFullAccess 혹은 AdministratorAccess 권한이 있는지 확인 후 실행
* s3.tf의  bucket 이름 unique하게 바꾸고 시작 ex) mybucket-jg11
  - iam.tf의 Policy s3-mybucket-role-policy에도 이름 바꿀 것
* 기존 key-pair 있으면 실행 안됨 ( aws ec2 delete-key-pair --key-name mykey
)
```
terraform init
terraform apply -auto-approve
```


4. Instance/S3 생성 확인 및 테스트
```
ip=$(cat terraform.tfstate |grep public_ip\"|awk 'BEGIN{FS="\""}{printf $4}')
  # =:= cat terraform.tfstate|grep public_ip
ssh -i ~/mykey ubuntu@$ip hostname

sudo -s
echo "test" > test.txt
aws s3 cp test.txt s3://mybucket-jg11/test.txt
curl https://mybucket-jg11.s3-eu-west-1.amazonaws.com/test.txt
exit 
```
* Curl명령 실패시 iam.tf파일 확인 그래도 안되면 Bucket의 파일에 퍼미션 줄 것(Everyone ==> Read Object)

5. destroy
* Destroy : 삭제시 S3버킷 비우고(Empty) 실행할 것.
```
terraform destroy -auto-approve
aws ec2 delete-key-pair --key-name mykey
```
