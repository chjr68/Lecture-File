# Kubernetes Install With Kubespray

0. OS key 생성 [있으면 생략]
```
ssh-keygen -f ~/.ssh/id_rsa -N ''
```
* cf) 설치 대상 host에 Public-key 배포
    ssh-copy-id root@10.0.2.10


1. Terraform으로 host 셋팅
```
terraform apply -auto-aprove
```

2. Hosts파일 셋팅
```
bash doSetHosts.sh
```

* cf) 아래와 같이 /etc/hosts파일을 직접 셋팅 해도 됨
```
52.213.183.141 vm01
54.75.118.15   vm02
54.75.118.154  vm03
```

3. git Clone
```
cd
git clone https://github.com/kubernetes-sigs/kubespray
```

4. inventory파일 생성
```
cd kubespray
cat > inventory/inventory.ini << EOF
[all]
vm01 etcd_member_name=etcd1
vm02 etcd_member_name=etcd2
vm03 etcd_member_name=etcd3

[kube-master]
vm01
vm02

[etcd]
vm01
vm02
vm03

[helm]
vm01

[kube-node]
vm01
vm02
vm03

[k8s-cluster:children]
kube-master
kube-node

EOF

cat ./inventory/sample/group_vars/k8s_cluster/addons.yml|sed 's/helm_enabled: false/helm_enabled: true/g' >/tmp/addons.yml
cp /tmp/addons.yml ./inventory/sample/group_vars/k8s_cluster/addons.yml

```

5. kubesparyInstall.sh 실행
```
wget https://gist.githubusercontent.com/nowage/a169b11372bf6a708bcb475d606471e2/raw/daa0fef590005ed5a70641e996c3c7f5a1a81972/k8sInstallByKubesray.sh
bash k8sInstallByKubesray.sh.sh
```
* ==
```
cat > k8sInstallByKubespray.sh <<EOF
if [ ! -f requirements.txt ]; then
    echo "go to kubespray install folder"
else
    sudo pip3 install -r requirements.txt
    sudo pip3  install ansible netaddr jinja2
    ansible-playbook --flush-cache -u ubuntu -b --become --become-user=root \
      -i inventory/inventory.ini \
      cluster.yml
fi
EOF
bash k8sInstallByKubespray.sh
```

# Admin
## Startup all Instance
```
ids=$(aws ec2 describe-instances  --filters "Name=tag-value,Values=vm0*" --query "Reservations[].Instances[].InstanceId" --output text)
for i in $ids; do     aws ec2 start-instances --instance-ids $i ;done
```
## Show All Instance state
```
aws ec2 describe-instance-status --output text
cd $thisPath
```

## Shutdown All Instance
```
for i in $(seq 3); do ssh vm0$i sudo sh -c 'shutdown -h now'; done
```
