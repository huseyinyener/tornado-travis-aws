#!/bin/bash

AWS_PUBLIC_KEY=$AWS_PUBLIC_KEY
AWS_PRIVATE_KEY=$AWS_PRIVATE_KEY
mkdir ~/.aws
cat > ~/.aws/config <<EOL
[profile eb-tornado-profile]
aws_access_key_id = ${AWS_PUBLIC_KEY}
aws_secret_access_key = ${AWS_PRIVATE_KEY}
EOL

cd src
eb init tornado-sample-app --region us-west-2 --profile eb-tornado-profile
eb deploy