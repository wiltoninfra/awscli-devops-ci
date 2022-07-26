# AWSCLI DevOps CI
   
Run the main commands to deploy or build services like aws using CLI.

## DevOps Tools
- AWSCLI=1.25.36

## Variables

```yaml
AWS_REGION=""
AWS_ACCESS_KEY=""
AWS_SECRET_KEY=""
```

## Usage

```yaml
- name: aws-cli-get-instances
  uses: wilton/awscli-devops-ci@v0.2.62
  id: get-ec2
  env: 
	AWS_REGION: "us-east-1"
	AWS_ACCESS_KEY: ${{ secrets.AWS_ACCESS_KEY }}
	AWS_SECRET_KEY: ${{ secrets.AWS_SECRET_KEY }}  
  with:
    command: aws ec2 describe-instances --instance-ids i-1234567890abcdef0
```
> Save as secrets in Github Actions Environments Settings your repository