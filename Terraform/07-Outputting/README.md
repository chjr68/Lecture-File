# Info
* Remote state : terraform.tfstate파일을 원격 저장소인 s3에 저장하는 예


# 실행 절차
1. 폴더로 이동
```
cd terraform-course/07-Outputting
```
* 주의 private_ips.txt 파일 있으면 지울 것

2. S3 Bucket 생성
   * aws → Service → S3 → Create Bucket → Bucket Name(unique하게)
   * 만들어진 bucket의 Properties(속성)에서 Versioning을 enable할것.(보안 셋팅을 Public으로 바꿀 필요 없음.)

3. 위2번에서 만든 S3 Bucket name을 소스코드에 입력
```
vi backend.tf
  # bucket = "xxxxx"  → bucket = "<S3 버킷이름>"
```
* 주의 : "aws configure" 셋팅 필수임(terraform에서 aws 명령으로 s3에 접근함)

4. init
```
terraform init
   # Bucket의 Region명 입력
terraform apply -auto-approve
```

5. apply
```
terraform apply -auto-approve
```

5. Instance 생성 확인
```
cat terraform.tfstate|grep public_ip
cat private_ips.txt
```


5. IP 확인
* private_ips.txt 에서 확인 private ip 확인

6. S3에서 terraform.tfstate 파일 확인
* 위에서 만든 S3 Bucket의 terraform.tfstate을 다운로드 받아서 public ip 확인 ["outputs"]["ip"]["value"]
* 로컬에 terraform.tfstate가 아니라 s3에 생긴 것을 확인할 것

7. instance Destroy
* 안보이면 Refresh버튼 클릭
```
terraform destroy -auto-approve
```


8. apply
```
terraform apply -auto-approve
```

9. S3에서 terraform.tfstate Version 확인
* Amazon S3 → Buckets → <버킷이름> → terraform.tfstate → Versions에서 추가된 버전 확인


10. instance Destroy
* EC2 Console에서 안보이면 Refresh버튼 클릭
```
terraform destroy -auto-approve
```


11. AWS Console에서 S3 객체 제거
* 버전 관리(Versioning)을 Disable할것
  - Amazon S3 → Buckets → <버킷이름> → Properties → Bucket Versioning → EDIT → Enable을 Suspend로 수정후 "I acknowledge the outcomes of suspending Bucket Versioning."에 Check → save changes
* 버킷 비우기
  - Amazon S3 → Buckets → <버킷이름> 선택후 "Empty" 혹은 "비어 있음" 클릭해서 비워줄 것.
* 버킷 삭제
  - Amazon S3 → Buckets → <버킷이름> 선택후 "Delete" 혹은 "삭제" 클릭해서 비워줄 것.
