# AWS VPC Network Lab — Architecture

## 1. Overview

This document describes the AWS network architecture implemented for the AWS VPC Network Lab.

The infrastructure is provisioned using Terraform and demonstrates the relationship between a VPC, subnets, Internet Gateway, route tables, Security Groups, and EC2.

---

## 2. Architecture

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
