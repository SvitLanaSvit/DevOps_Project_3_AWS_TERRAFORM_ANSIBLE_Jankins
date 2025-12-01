[jump]
${public_ip}

[worker]
${private_ip}

[jump:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/id_rsa

[worker:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/id_rsa
ansible_ssh_common_args='-o ProxyCommand="ssh -i ~/.ssh/id_rsa -W %h:%p ubuntu@${public_ip}"'