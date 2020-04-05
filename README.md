# helping-others

This is one of those "give back" projects in which we can help others
with simple actions

- [helping-others](#helping-others)
  - [Requirements](#requirements)
  - [How to run this project](#how-to-run-this-project)
  - [Cleanup](#cleanup)

## Requirements

For running *folding at home* project we require you to have terraform
installed. For instructions on how to do this go
to [LINK]([https://link](https://learn.hashicorp.com/terraform/getting-started/install.html))

You will also need an AWS account and have your credentials correctly set.
For information on how to do this [CLICK HERE](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/) and then [CLICK HERE](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html).
If you dont have aws cli installed, please [CLICK HERE FIRST](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

You will also need packer installed to generate the AMIs you need to run this.
Click on [THIS LINK](https://packer.io/docs/install/index.html) to check how to
install this software.

## How to run this project

In order to run Folding at home project on AWS Cloud you will need to first generate the AMIs
using the following commands:

```bash
cd ./folding-at-home/packer
packer build linux_ami.json
packer build gpu-enabled-ami.json
```

with the generated AMIs you are ready to go.

```bash
cd ./folding-at-home
terraform init
terraform plan -var ami_id=<ami_id generated> -var public_key="<your public key>"
terraform apply -var ami_id=<ami_id generated> -var public_key="<your public key>"
```

It's that easy.

## Cleanup

If you'd like to stop everything and remove the resources we created your will have to execute the following command:

```bash
terraform destroy
```
