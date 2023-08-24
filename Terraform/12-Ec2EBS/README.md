# Info
* VPC와 Subnet생성후 Volume 생성 후 Instance 생성까지만 구현함.
* 수동으로 fdisk·format,·mount 해볼 것.어려움(!). fdisk·format,·mount등의 과정을 이해하는 것이 목적임.
  - 시연 위주임(꼭 따라하지 못해도 과정만 이해하면 다음 과정을 진행하는데는 문제 없음)
* 다음번 예제에서 자동으로 fdisk·format,·mount 하는 것을 다룸

# 실행 절차
1. 폴더로 이동
```
cd terraform-course/12-Ec2EBS
```

2. init 및 apply
```
terraform init
terraform apply -auto-approve
```


3. Instance 생성 확인 및 추가로 생성된 Volume확인
```
ip=$(cat terraform.tfstate |grep public_ip\"|awk 'BEGIN{FS="\""}{printf $4}')
  # =:= cat terraform.tfstate|grep public_ip
ssh -i ~/mykey ubuntu@$ip
```
* 추가로 생성된 Volume확인
* AWS Console → EC2 → Volumes

4. 수동으로 fdisk·format,·mount
* ssh로 생성된 instance에 접속해서 아래 과정 실행
```
df
ls /dev|grep xvd
sudo -i
fdisk /dev/xvdh
    # < 설정 > : n → p → <enter> → <enter>  → <enter> → p → w

mkfs.ext4  /dev/xvdh1
mkdir /data1
mount /dev/xvdh1 /data1
df -h
echo "/dev/xvdh1 /data1 ext4 defaults 0 1" >> /etc/fstab
reboot
  # Exit 됨

ssh -i ~/mykey ubuntu@$ip
df -h
exit
```

5. destroy
* AWS Console→EC2에서 해당 instnace 삭제후 실행
  - Volume을 수동으로 연동해서 Volume삭제 안되서 instance도 삭제 안되고, 해당 인스턴스를 사용하고 있는 VPC도 삭제 안됨.
```
terraform destroy -auto-approve
aws ec2 delete-key-pair --key-name mykey
```
