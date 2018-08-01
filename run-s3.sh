#!/bin/bash

S3TEST_CONF=config/config.s3 virtualenv/bin/nosetests \
            -e delimiter \
            -e fuzzer \
            -e website \
            -e versioning \
            -e sse_kms \
            -e acl \
            -a '!bucket-policy,!fails_on_aws,!fails_with_subdomain,!lifecycle,!tagging,!ACLs,!versioning,!CORS,!Nonowner' \
            --processes=0 \
            s3tests/functional/test_s3.py \
            &> res/s3 &
#            -v --collect-only \
