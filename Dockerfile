# app/Dockerfile

# use the ECR repo base-image link
FROM [YourAccountID].dkr.ecr.[YourRegion].amazonaws.com/[ECR-repo-base-image]:3.10-slim-buster

WORKDIR /app


COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt &&\
    apt-get update -y &&\
    apt-get install curl -y 

COPY . .

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# replace YourWebApp.py with the relevant file name
ENTRYPOINT ["streamlit", "run", "YourWebApp.py", "--server.port=8501", "--server.address=0.0.0.0"]