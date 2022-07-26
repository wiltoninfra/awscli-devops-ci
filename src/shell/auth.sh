#!/usr/bin/env bash
#
#  Author		: Wilton Guilherme
#  Manteiner 	: CodeView Consultoria
#
#  AWS DevOps CI Tools
#  Copyright © 2021 CodeView Consultoria, All Rights Reserved
#
set -o errexit

# AWS env config
AWS_REGION=$AWS_REGION
AWS_ACCESS_KEY=$AWS_ACCESS_KEY
AWS_SECRET_KEY=$AWS_SECRET_KEY

validate_vars() {
if [ -z ${AWS_REGION} ]; then { echo "AWS_REGION is var not defined"; exit 1; } fi 
if [ -z ${AWS_ACCESS_KEY} ]; then { echo "AWS_ACCESS_KEY is var not defined"; exit 1; } fi 
if [ -z ${AWS_SECRET_KEY} ]; then { echo "AWS_SECRET_KEY is var not defined"; exit 1; } fi 
}

verify_files () {
    if [ ! -d /root/.aws ]
    then mkdir -p /root/.aws
    fi
}

aws_config () {
    sed -e "s;%AWS_REGION%;$AWS_REGION;g" /srv/aws-config.tmpl > /root/.aws/config
    sed -e "s;%AWS_ACCESS_KEY%;$AWS_ACCESS_KEY;g" -e "s;%AWS_SECRET_KEY%;$AWS_SECRET_KEY;g" /srv/aws-credentials.tmpl > /root/.aws/credentials
}

validate_vars
verify_files
aws_config
echo "🚀 Authentication configured 🚀" >&2
