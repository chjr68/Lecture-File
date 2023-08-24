# Info
* Consul Module이라는 외부 모듈을 통한 Instance Provisioning 예(SecurityGroups/Instance 등을 생성)
* 향후 예제에 대한 예행연습 - 다음 예제들은 Consul툴 없이 SecurityGroups/Instance 등을 생성
# consul에 관하여
* 서비스 검색 및 구성 오케스트레이션 등의 기능을 데이터 센터에 걸쳐 가용성이 높은 방식으로 제공하는 도구이다.

|Name           |URL                                                                        |
|---------------|---------------------------------------------------------------------------|
|Consul         |https://www.consul.io                                                      |
|국내 적용 사례 |http://woowabros.github.io/tools/2018/10/08/location-service-with-rcs.html |




# 주의
* 서울 리전에서 작동 안하니까 eu-west-1에서 구현할 것.
* 다시 실행할때는 ec2의 Key Pair에서 mykey 지우고 실행


# 실행 절차
1. 폴더로 이동
```
cd terraform-course/09-Modules
```

2. init 및 apply
```
terraform init
terraform apply -auto-approve
```


4. Module Download 확인 및 Instance 생성 확인
* Subnet/SecurityGroups 및 3개의 instnace 생성 확인
* 주의 : Apply 실패시 "terraform destroy -auto-approve" 필수(VPC만 생성하고 Instnace가 생성 안되서 실패하는 경우 있음)
  - cf) aws ec2 delete-security-group --group-id sg-0f238a5b0ebf286d0 # Group Name이 아님 주의

```
ls .terraform/modules/consul/
cat terraform.tfstate|grep public_ip
ssh -i ~/mykey ubuntu@<ip1> hostname
ssh -i ~/mykey ubuntu@<ip2> hostname
ssh -i ~/mykey ubuntu@<ip3> hostname
curl <ip>
```

6. destroy
```
terraform destroy -auto-approve
aws ec2 delete-key-pair --key-name mykey
```
