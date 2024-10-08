# codesk

codesk is a Linux _development environment_ aimed at Windows users.
It can be packaged as a _virtual machine_ or Docker _container_; it is based on **Ubuntu Server 22.04 LTS Jammy Jellyfish** and managed by means of **Vagrant** and packed with some handy development software. 


## Additional software installed

- Docker Engine (rootless);
- AWS cli;
- AWS sam;
- AWS CDK (Cloud Development Kit)
- GNU Parallel;
- Python 3.11
- tmux, ranger
- Terraform


Ubuntu Server 22.04 LTS specs:
- Kernel 5.15;
- 2022-04-21 Release;
- 2027-04-21 Support;
- 2032-04-21 Security support.

## Requisites

- Oracle [VirtualBox](https://www.virtualbox.org);
- HashiCorp [Vagrant](https://www.vagrantup.com).

## Get started

Open a PowerShell and execute the following command:
```bash
$ git clone https://github.com/robertorussobob/codesk.git; cd codesk; ./up.ps1
```

You will see the VM building that starts:

![](./codesk1.png)

than you will see the VM building that ends and lands you at the Ubuntu shell prompt:

![](./codesk2.png)

That's all.

