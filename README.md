# AWS VPC Network Lab

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC)
![VPC](https://img.shields.io/badge/Amazon%20VPC-Networking-blue)
![EC2](https://img.shields.io/badge/Amazon%20EC2-Compute-orange)

A hands-on AWS networking project built with **Terraform** to design, provision, secure, and validate a custom Virtual Private Cloud.

This project demonstrates core AWS networking concepts including **VPCs, CIDR planning, public and private subnets, Internet Gateway, route tables, Security Groups, EC2, Nginx, and network connectivity**.

---

## Architecture

```text
                         INTERNET
                            |
                            v
                  +------------------+
                  | Internet Gateway |
                  +--------+---------+
                           |
                    +------v------+
                    |     VPC     |
                    | 10.0.0.0/16 |
                    +------+------+
                           |
              +------------+------------+
              |                         |
       +------v-------+          +------v--------+
       | Public Subnet|          | Private Subnet|
       | 10.0.1.0/24  |          | 10.0.2.0/24   |
       |              |          |               |
       | EC2 + Nginx  |          | No public IP  |
       +--------------+          +---------------+
              |
              v
       Public Route Table
          0.0.0.0/0
              |
              v
      Internet Gateway
