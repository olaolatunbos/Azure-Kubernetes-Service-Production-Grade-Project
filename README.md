# AKS Cluster Deployment with ArgoCD, Helm Charts, Cert-Manager, and ExternalDNS

## Overview

This project focuses on deploying an **AKS (Azure Kubernetes Service)** cluster on AWS, integrating key Kubernetes tools such as **ArgoCD**, **Helm Charts**, **Cert-Manager**, and **ExternalDNS**. The goal is to achieve an automated, and scalable infrastructure setup with GitOps workflows, secure certificate management, and automated DNS updates.

> **Note:** This project is currently under development and subject to continuous updates.

---

## Key Features

- **Azure Kubernetes Service**  
  Managed Kubernetes service for running containerized applications at scale with high availability.

- **ArgoCD**  
  Declarative GitOps continuous delivery tool for Kubernetes, enabling automatic application deployment from Git repositories.

- **Cert-Manager**  
  Automates the management and issuance of TLS/SSL certificates within Kubernetes, integrated with ACME for automated renewals.

- **ExternalDNS**  
  Dynamically manages DNS records in Azure DNS based on Kubernetes resources, automating DNS record creation and updates.

- \*_Prometheus_  
  Dynamically manages DNS records in Azure DNS based on Kubernetes resources, automating DNS record creation and updates.

- **Grafana**  
  Dynamically manages DNS records in Azure DNS based on Kubernetes resources, automating DNS record creation and updates.

---

## Why This Setup Matters

- **GitOps with ArgoCD**  
  Ensures consistent, version-controlled deployments through automated Git synchronization.

- **Scalable Infrastructure**  
  Utilizes AKS for auto-scaling and high availability.

- **Secure Communication**  
  Implements TLS/SSL for encrypted traffic with Cert-Manager.

- **Automated DNS Management**  
  ExternalDNS reduces manual effort by automating DNS configurations.

---
