# Building the initial Image

### Step 2a: Login to ECR

- Set the Env variable on your machine
  ```bash
  export REPO_NAME=WebAppName:latest
  export CONTAINER_NAME=WebAppName
  export IMAGE_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com" 
  ```
- Run the following aws command to login to ECR
  ```bash
  aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $IMAGE_URL
  ```
### Step 2b: Build and Push the Image

- Run the following commands from the root directory
  ```bash
  docker build -t YourAppTag .
  docker tag $REPO_NAME $IMAGE_URL/$REPO_NAME
  docker push $IMAGE_URL/$REPO_NAME
  ```
