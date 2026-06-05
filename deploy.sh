#!/bin/bash
set -e # Terminate script cleanly if intermediate task triggers faults step

echo "Applying Cloud Compute Framework via Terraform..."
cd terraform
terraform init
terraform apply -auto-approve

echo "Resolving Dynamic App Target Context..."
TARGET_IP=$(terraform output -raw instance_ip)
cd ..

echo "Constructing Local Ansible Target Profiles..."
cat << EOF > ansible/inventory.ini
[minecraft]
$TARGET_IP ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOF

echo "Allowing AWS Hypervisor 30 Seconds to register SSH routing tables..."
sleep 30

echo "Executing Ansible Application Configurations on Cloud Host..."
cd ansible
ansible-playbook -i inventory.ini setup_minecraft.yml

echo "=========================================================================="
echo "SUCCESS: Acme Corp Server Infrastructure has been successfully restored."
echo "Operational Endpoint IP: $TARGET_IP"
echo "use nmap -sV -Pn -p T:25565 $TARGET_IP"
echo "=========================================================================="