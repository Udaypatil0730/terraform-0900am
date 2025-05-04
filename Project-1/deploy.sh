#!/bin/bash
bucket="devops-static-site-bucket"
aws s3 cp website/ s3://$bucket --recursive
    