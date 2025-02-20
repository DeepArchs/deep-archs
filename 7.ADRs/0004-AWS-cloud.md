# **ADR-0004: Use of AWS Cloud Platform**

## **Date:**

2025-02-12

## **Status:**

Accepted

## **Context**

Certifiable Inc. is experiencing a significant increase in certification requests due to global expansion and growing demand for software architect licensing. The current infrastructure is unable to scale efficiently to meet the increased workload and ensure smooth performance. The company needs a cost-efficient, scalable, and reliable cloud platform to support its operations and leverage AI capabilities for automated grading and other functionalities.

The **goal** is to leverage the AWS cloud platform to:

1. **Enhance system scalability and elasticity** to handle varying loads.
2. **Improve system reliability and availability** through redundancy and failover mechanisms.
3. **Ensure global accessibility** by implementing CDNs and complying with local regulations.
4. **Leverage AI services** provided by AWS to enhance automated grading and other AI-driven functionalities.
5. **Enhance security and compliance** with data privacy regulations.

## **Decision**

We will adopt the **AWS cloud platform** for Certifiable Inc.'s infrastructure. The solution includes:

### **1. Scalability and Elasticity**

- Use AWS Auto Scaling and Elastic Load Balancing to automatically scale resources based on demand.
- Implement AWS Lambda for serverless computing to handle varying loads efficiently.

### **2. Reliability and Availability**

- Deploy the system across multiple AWS regions to ensure high availability and minimize downtime.
- Implement AWS RDS Multi-AZ deployments for database redundancy and failover.

### **3. Global Accessibility**

- Use Amazon CloudFront as a CDN to reduce latency and improve access speed for users worldwide.
- Ensure compliance with local data privacy regulations by using AWS data residency controls.

### **4. AI Services**

- Leverage AWS AI services such as Amazon SageMaker for building, training, and deploying machine learning models.
- Use Amazon Comprehend for natural language processing and Amazon Rekognition for image and video analysis.

### **5. Security and Compliance**

- Implement AWS Identity and Access Management (IAM) for secure access control.
- Use AWS Key Management Service (KMS) for data encryption at rest and in transit.
- Conduct regular security assessments using AWS Security Hub and AWS Inspector.

## **Consequences**

### **Positive Outcomes**

* [X]**Scalability:** AWS enables seamless scaling to accommodate the growing number of certification requests.
* [X]**Reliability:** Multi-region deployments and failover mechanisms ensure high system availability.
* [X]**Global Accessibility:** CDNs and compliance with local regulations enhance user experience worldwide.
* [X]**AI Capabilities:** AWS AI services provide advanced tools for automated grading and other AI-driven functionalities.
* [X]**Security:** Robust security measures and compliance with data privacy regulations protect sensitive data.

### **Risks & Mitigation**

**Risk: Vendor lock-in**
Mitigation: Use a multi-cloud strategy and design the system to be cloud-agnostic where possible.

**Risk: Cost management**
Mitigation: Implement cost monitoring and optimization tools provided by AWS to manage expenses effectively.

**Risk: Data privacy concerns**
Mitigation: Ensure compliance with data privacy regulations and use AWS data residency controls.

---