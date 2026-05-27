prepare:
	ansible-galaxy install -r requirements.yml -f
	ansible-playbook -i inventory.ini playbook.yml

deploy:
	ansible-playbook -i inventory.ini deploy.yml
