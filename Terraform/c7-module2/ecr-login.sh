#!/bin/bash
REGION="ap-northeast-2"
`aws ecr get-login --no-include-email --region ${REGION}`
