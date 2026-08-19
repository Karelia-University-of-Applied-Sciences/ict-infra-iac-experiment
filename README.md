# iac
Sample repository for experimenting with Terraform (opentofu) and Ansible infrastructure as code (IaC) tools. Terraform is used for creating a new virtual machine (VM) and Ansible is used for installing software on the VM. This experiment is made on Nutanix system. You should install tofu and ansible before running these scripts.

## Terraform

Before use run ~/config/lab_infra_iac/nutanix.env file to read secrets not stored in the github (username, password, etc.):
```
source ./set-secrets.sh
```

The variables that has to be set with this script are as follows:

```
export TF_VAR_nutanix_username="typevaluehere"
export TF_VAR_nutanix_password="typevaluehere"
```

Folder structure:

```
.
├── environments
│   ├── edu
│   ├── rd
│   └── vm-example
│       ├── main.tf
│       ├── outputs.tf
│       ├── terraform.tfstate
│       ├── terraform.tfstate.backup
│       ├── terraform.tfvars
│       ├── variables.tf
│       └── vm-example.tfplan
├── modules
│   └── nutanix-vm
│       ├── cloud-init.yml.tftpl
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── set-secrets.sh

```

All the project use cases reside on the environments folder. The example case can be found from environments/vm-example folder. All the commands presented below should be issued under the particular subfolder under the environments folder.

Init terraform

```
tofu init
```

Validate

```
tofu validate
```

Plan

```
tofu plan -out yourplannamehere.tfplan
```

Apply the plan

```
tofu apply yourplannamehere.tfplan
```

Destroy the resources

```
tofu destroy
```

## Ansible

The sample ansible playbook play-tf-example.yml installs ngingx to a server created by the terraform vm-example plan. Check the IP number of the machine before executing the play-tf-example.yml playbook.

Folder structure:

```
.
├── inventories
│   └── lab
│       └── vms.yml
├── playbooks
│   ├── files
│   │   ├── index.html
│   │   └── nginx.conf
│   ├── play-tf-example.yml
│   └── play-upgrades.yml
└── roles
    └── motds
        └── templates
            └── motd.j2

```

Run the sample playbook:
```
cd ansible/playbooks
ansible -i ../inventories/lab/vms.yml play-tf-example.yml
```

Example: ping all the linux_servers:

```
ansible linux_servers -m ping -i ../inventories/lab/vms.yml
```
