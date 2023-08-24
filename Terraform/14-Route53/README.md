# Info
* Route53이라는 DNS서버 서비스 예

# 실행 절차
1. 폴더로 이동
```
cd terraform-course/
```

2. init 및 apply
```
terraform init
terraform apply -auto-approve
```


3. DNS 작동 여부 테스트
* Route53의 SOA ip
  - AWS Console → Route53 → finfra.com 확인
  - 첫번째 url 복사 : ex) ns-329.awsdns-41.com
  - ip 찾아냄 : $ ping search ns-329.awsdns-41.com

* Console Instance에 DNS서버 추가 : 아래 cp 명령 실패하면 vi로 입력
```
sudo cp /etc/resolv.conf /resolv.conf
sudo vi /etc/resolv.conf
    nameserver <ip>
ping server1.finfra.com
sudo cp /resolv.conf /etc/resolv.conf
ping server1.finfra.com
```

4. destroy
```
terraform destroy -auto-approve
```
