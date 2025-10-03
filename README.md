# EventBridge Demo – Resilient Event-Driven Microservices on AWS

This repository demonstrates an event-driven microservices architecture on AWS, with a focus on **resilience, traceability, and modular design**.

## Features
- **EventBridge** as the central event bus with routing rules and optional scheduled events.
- **Lambda** functions (Python) with idempotency enforced via DynamoDB conditional writes.
- **DynamoDB** for storage and replay-safe event processing.
- **SQS DLQ** for resilience and fault isolation.
- **CloudWatch Alarms & X-Ray** for observability and traceability.
- **Terraform modules** to provision infrastructure as code.
- **CI/CD pipelines** integrated via GitHub Actions (bootstrapped with my standard pipeline script).

## Repo structure
- `modules/` – Terraform modules (eventbridge, lambda, dynamodb, sqs, alarms)
- `envs/dev/` – Example environment with Terraform root config
- `lambda/` – Lambda function code (Python)
- `README.md` – This file
