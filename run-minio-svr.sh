#!/bin/bash

S3TEST_CONF=config/config.minio.svr virtualenv/bin/nosetests \
            -e delimiter \
            -e fuzzer \
            -e website \
            -e versioning \
            -e sse_kms \
            -e acl \
            -a '!bucket-policy,!fails_on_aws,!fails_with_subdomain,!lifecycle,!tagging,!ACLs,!versioning,!CORS,!Nonowner' \
            --processes=1 \
            s3tests/functional/test_s3.py \
            &> res/minio.svr &
#            -v  --collect-only \
