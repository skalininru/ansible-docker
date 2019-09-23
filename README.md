# Running Ansible Playbook inside Docker

Build image:

```docker build -t docker-ansible .```

Run playbook:

```docker run --rm -it -v LOCAL_PLAYBOOKS_DIR:/ansible docker-ansible PLAYBOOK.yml```

For example:

```
cd my_ansible_roles
docker run --rm -it -v $(pwd):/ansible docker-ansible nginx.yml -i inventory
```

You can mount an SSH key pair and specify variables:

```
docker run --rm -it \
   -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
   -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
   -v $(pwd):/ansible docker-ansible timezone_setup.yml \
   --extra-vars "my_timezone=Europe/Moscow" -i hosts
```
