prepare:
	ansible-galaxy install -r requirements.yml -f
	ansible-playbook -i inventory.ini playbook.yml