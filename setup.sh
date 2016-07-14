#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ansible-playbook -i inventory/production plays/vpc_ec2.yml
$DIR/inventory/production/ec2.py --refresh-cache
ansible-playbook -i inventory/production plays/ec2_provision.yml
ansible-playbook -i inventory/production plays/scale.yml