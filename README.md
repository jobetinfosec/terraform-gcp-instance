# Create Google Cloud Platform (GCP) instance using Terraform


## Description

Create a "f1-micro" (1CPU 1GB RAM) GCP instance (Virtual Machine VM) running Debian 10 using Terraform provisioning tool.



## Requisites

a) Google Cloud Platform account<br />
b) An SSH key pair on your laptop<br />
c) Terraform installed<br />



## Instructions

a) On your laptop create a working directory


b) On GCP dashboard create a service account (https://console.cloud.google.com/apis/credentials/serviceaccountkey?_ga=2.165926910.1953672453.1597929334-800821880.1595409327), and download the credentials JSON file into working directory


c) In your working directory open a console window


d) Clone github repository

```
git clone https://github.com/jobetinfosec/terraform-gcp-instance.git
```


e) Switch to terraform-gcp-instance directory

```
cd terraform-gcp-instance
```


f) Open main.tf file

```
nano main.tf
```


g) Replace <TEMPORARY_ITEMS> with your own data:

`<CREDENTIALS_FILE>.json`     replace <CREDENTIALS-FILE> with the actual name of your credentials file<br />
`<PROJECT_ID>`                replace it with your project ID (see in your GCP dashboard)<br />
`<REGION>`                    replace it with your preferred region (Ex. europe-west1)<br />
`<ZONE>`                      replace it with your preferred zone (Ex. europe-west1-b)<br />
`<USER_NAME>`                 replace it with your laptop user's name<br />
`<KEY_NAME>`                  replace it with your public key's name<br />


h) Initialize Terraform

```
terraform init
```


i) Check for errors

```
terraform plan
```


j) Create instance

```
terraform apply
```


k) SSH into the newly created GCP instance

```
ssh `terraform output ip`
```


l) If you want to delete the instance, use:

```
terraform destroy
```

