# Info
* 로그인 가능한 인스턴스를 여러 리전에서 구현 가능함을 보여주는 예
* Public key,Private key, User이름 등을 변수에서 읽어옴
* 기존 예제에서 EC2의 Key Pair가 지워지지 않음을 확인


# 주의
* aws 명령을 실행시 "aws configure" 셋팅 필수
* 처음 실행시 실패함을 확인하고, "aws ec2 delete-key-pair --key-name mykey"명령으로

# 실행 절차
1. 폴더로 이동
```
aws configure

cd terraform-course/04-Provisioner_files
```

2. ssh key 확인 및 init
```
ls ~/mykey
terraform init
```

3. apply : -auto-approve 하면 중간에 Yes입력 안해도 됨.
```
terraform apply -auto-approve
```

4. Error확인
```
│
│ Error: Error import KeyPair: InvalidKeyPair.Duplicate: The keypair 'mykey' already exists.
│ 	status code: 400, request id: 3cf78da4-80a5-4ed8-96dc-5c4265dd4050
│
```

5. key pair삭제 후
```
aws ec2 delete-key-pair --key-name mykey
```

6. Destroy 후 다시 실행
```
terraform destroy -auto-approve
terraform apply -auto-approve
```

4. Instance 생성 확인
```
cat terraform.tfstate|grep public_ip

ssh -i ~/mykey ubuntu@<ip> hostname
```

6. destroy
```
terraform destroy -auto-approve
aws ec2 delete-key-pair --key-name mykey

```
