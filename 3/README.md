# Example 3
- This examples shows how to create a s3 bucket
- AWS CLI should be installed
- Localstack container should be up and running


```bash
docker run -it --network host --rm -v ${PWD}:/terraform -w /terraform  hashicorp/terraform init 
```  
```bash
docker run -it --network host --rm -v ${PWD}:/terraform -w /terraform -e AWS_ACCESS_KEY_ID="test" -e AWS_SECRET_ACCESS_KEY="test" -e AWS_DEFAULT_REGION="us-east-1" -e AWS_ENDPOINT_URL="http://localhost:4566" hashicorp/terraform plan
```
```bash
docker run -it --network host --rm -v ${PWD}:/terraform -w /terraform -e AWS_ACCESS_KEY_ID="test" -e AWS_SECRET_ACCESS_KEY="test" -e AWS_DEFAULT_REGION="us-east-1" -e AWS_ENDPOINT_URL="http://localhost:4566" hashicorp/terraform apply --auto-approve
```
- Keep in mind
```bash
aws sts get-caller-identity
aws configure
docker run --network localstack --rm -it amazon/aws-cli --endpoint-url=http://localstack:4566 lambda list-functions
export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"
export AWS_ENDPOINT_URL="http://localhost:4566"
```bash

- https://docs.localstack.cloud/user-guide/integrations/aws-cli/

