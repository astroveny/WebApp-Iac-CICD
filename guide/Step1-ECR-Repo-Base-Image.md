### Step 1a: Create an ECR repository for the Base-image

- Run the following aws command to create the ECR repository:
    
```bash
aws ecr create-repository --repository-name webapp-base-image --image-tag-mutability MUTABLE
```

### Step 1b: Create ECR repository for the Web App Container Image
    
- Run the following aws command to create the ECR repository:

```bash
aws ecr create-repository --repository-name webapp --image-tag-mutability MUTABLE
```

- Note the repository name, to use it in the Dockerfile

### Step 1c: Create the Base-Image

- Set the Env variable on your machine
  ```bash
  export AWS_ACCOUNT_ID=YourAWS-ID
  export AWS_DEFAULT_REGION=AWS-Region
  export ECR_PYTHON_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/webapp-base-image"
  ```
- Login to ECR
    
  ```bash
  aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
  ```
- Pull the image from Docker Hub
    
  ```bash
  docker pull python:3.10-slim-buster
  ```
- Tag the image
  
  ```bash
  docker tag python:3.10-slim-buster $ECR_PYTHON_URL:3.10-slim-buster
  ```
- Push the image to ECR repository
  
  ```bash
  docker push $ECR_PYTHON_URL:3.10-slim-buster
  ```
      

