ansible-playbook -i ${tool_name}-internal.vikramdevops.tech, -e ansible_user=ec2-user -e ansible_password=${SSH_PASSWORD} -e tool_name=${tool_name} setup-tool-service.yml -e vault_token=${vault_token}