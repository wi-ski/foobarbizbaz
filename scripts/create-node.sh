#!/bin/bash

AWS_AK=$AWS_ACCESS_KEY_ID
AWS_SK=$AWS_SECRET_ACCESS_KEY
AWS_VPC=$AWS_VPC_KEY_SET_MANUALLY
AWS_REGION='us-east-1'

NODE_NAME=$1
MTYPE=$2
MACHINE_TYPE=${MTYPE:='t2.micro'}

docker-machine create --driver amazonec2 \
    --amazonec2-access-key $AWS_AK \
    --amazonec2-secret-key $AWS_SK \
    --amazonec2-vpc-id "${AWS_VPC}" \
    --amazonec2-region "${AWS_REGION}" \
    --amazonec2-instance-type "${MACHINE_TYPE}" \
    ${NODE_NAME}

echo "${NODE_NAME} should be available in a minute."
