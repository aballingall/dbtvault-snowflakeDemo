<p align="center">
  <img src="https://user-images.githubusercontent.com/25080503/65772647-89525700-e132-11e9-80ff-12ad30a25466.png">
</p>

### dbt models for dbtvault Snowflake Demonstration

This is a derivation of a downloadable example dbt project using [dbtvault](https://github.com/Datavault-UK/dbtvault) to create a Data Vault 2.0 Data Warehouse based on the Snowflake TPC-H dataset. The main difference is a Makefile for getting going quickly.

## Prerequisites

### Snowflake test account

Sign up for a [free trial](https://signup.snowflake.com/) of Snowflake

### Homebrew dbt

Do **not** install dbt with brew. This project will install the correct version of dbt via python which works with the demo.

### Private Key for Snowflake

Create an encrypted RSA Key compatible with Snowflake. Instructions [here](https://docs.snowflake.com/en/user-guide/key-pair-auth.html).

### dbt Profile

Create a file `~/.dbt/profile.yml` to contain connection information for snowflake using the private key you generated above, containing:

```yml
dbtvault_snowflake_demo:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <account>.<region>.aws # e.g. RQ91142.eu-west-2.aws

      user: <snowflake user> # e.g. andyballingallvred 
      role: <ROLE> # e.g. SYSADMIN (just for this demo - not good practice generally)

      private_key_path: <path/to/private/key> # e.g. /Users/person/.ssh/id_rsa_sf_demo.p8
      private_key_passphrase: <passphrase> # e.g. peanuts

      database: DV_PROTOTYPE_DB
      warehouse: DV_PROTOTYPE_WH
      schema: DEMO
      threads: 4
      client_session_keep_alive: False
```

## First time install

After cloning, run:

```sh
make venv
```

## Quick Start

Recommend you read the accompanying guide (see below), but to skip the demo steps and build out the Data Vault:

### Create Data Warehouse and Test Database

Sign into the snowflake console, then run the following (with `SYSADMIN` role).

```sql
create database dv_prototype_db;

create warehouse dv_prototype_wh with
warehouse_size =xsmall
auto_suspend=300
auto_resume=true;
```
This sql allows you to skip the configuration of these objects with the UI in the guide.

### Build the Data Warehouse models:

```sh
make run
```

Check out the `Makefile` for convenient cli commands.

---

#### dbtvault Docs
[![Documentation Status](https://readthedocs.org/projects/dbtvault/badge/?version=latest)](https://dbtvault.readthedocs.io/en/latest/?badge=latest)

Click the button above to read the latest dbtvault docs.

A guide for using this demo is available [here](https://dbtvault.readthedocs.io/en/latest/worked_example/we_worked_example/)

---
[dbt](https://www.getdbt.com/) is a registered trademark of [Fishtown Analytics](https://www.fishtownanalytics.com/).

Check them out below:

#### DBT Docs
- [What is dbt](https://dbt.readme.io/docs/overview)?
- Read the [dbt viewpoint](https://dbt.readme.io/docs/viewpoint)
- [Installation](https://dbt.readme.io/docs/installation)
- Join the [chat](http://ac-slackin.herokuapp.com/) on Slack for live questions and support.
---
