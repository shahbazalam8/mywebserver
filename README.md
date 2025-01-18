
## WebServer

This repository contains a simple Docker-based web server application.
It includes a GitHub Actions workflow that automates the process of building the Docker image and pushing it to an AWS Elastic Container Registry (ECR) upon every push to the `main` branch.

---

## Features

- **Dockerized Web Server**: The application is containerized for easy deployment and scalability.
- **Automated CI/CD**: GitHub Actions workflow to build and push Docker images to AWS ECR.
- **AWS Integration**: Seamless integration with AWS for image storage and deployment.

---
## Repository Structure

```bash
mywebserver/
├── Dockerfile         # Dockerfile to build the web server image
├── .github/
│   └── workflows/
│       └── aws.yml  # GitHub Actions workflow
├── index.html               # Application source code
├── README.md          # Repository documentation
└── other-files        # Additional files, if any
```


## Prerequisites

1. **AWS Account**: Ensure you have an AWS account and an ECR repository set up.
2. **GitHub Secrets**: Add the following secrets to your GitHub repository:
   - `AWS_ACCESS_KEY_ID`: Your AWS access key.
   - `AWS_SECRET_ACCESS_KEY`: Your AWS secret key.
   - `AWS_REGION`: The region of your ECR repository (e.g., `us-east-1`).
   - `ECR_REPOSITORY`: The name of your ECR repository.

---

## GitHub Actions Workflow

The GitHub Actions workflow is triggered automatically upon every push to the `main` branch. Here's what the workflow does:

1. **Checkout Code**: Pulls the latest code from the repository.
2. **Login to AWS ECR**: Authenticates with AWS using the provided secrets.
3. **Build Docker Image**: Builds the Docker image using the `Dockerfile`.
4. **Tag Docker Image**: Tags the image with the latest commit hash or a specific version.
5. **Push to ECR**: Pushes the tagged Docker image to the specified AWS ECR repository.

---

## Usage

### 1. Clone the Repository
```bash
git clone https://github.com/shahbazalam8/mywebserver.git
cd mywebserver
```

### 2. Build Locally (Optional)
To build the Docker image locally:
```bash
docker build -t mywebserver:latest .
```

### 3. Test Locally (Optional)
Run the web server locally:
```bash
docker run -p 8080:80 mywebserver:latest
```
Access the web server at `http://localhost:8080`.

### 4. Push Changes to Main Branch
Commit and push your changes to the `main` branch:
```bash
git add .
git commit -m "Your commit message"
git push origin main
```

This will trigger the GitHub Actions workflow.

---

## Workflow Example

Here’s a snippet of the `.github/workflows/docker-build.yml` file:

```yaml
name: Docker Build and Push to ECR

on:
  push:
    branches:
      - main

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v3

      - name: Login to AWS ECR
        uses: aws-actions/amazon-ecr-login@v1

      - name: Build Docker Image
        run: |
          docker build -t ${{ secrets.ECR_REPOSITORY }}:latest .

      - name: Tag Docker Image
        run: |
          IMAGE_URI=${{ secrets.AWS_ACCOUNT_ID }}.dkr.ecr.${{ secrets.AWS_REGION }}.amazonaws.com/${{ secrets.ECR_REPOSITORY }}
          docker tag ${{ secrets.ECR_REPOSITORY }}:latest $IMAGE_URI:latest

      - name: Push to AWS ECR
        run: |
          IMAGE_URI=${{ secrets.AWS_ACCOUNT_ID }}.dkr.ecr.${{ secrets.AWS_REGION }}.amazonaws.com/${{ secrets.ECR_REPOSITORY }}
          docker push $IMAGE_URI:latest
```

---

## Contributing

Feel free to contribute to this project by creating issues or submitting pull requests. Any contributions, bug fixes, or enhancements are greatly appreciated.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contact

For questions or support, please contact [Shahbaz Alam](mailto:shabazalam8@gmail.com).
```

This `README.md` file provides a clear overview of your repository, instructions for setting up, and details about the GitHub Actions workflow. Let me know if you need further adjustments!
