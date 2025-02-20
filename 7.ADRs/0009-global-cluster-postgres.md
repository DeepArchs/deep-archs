# **ADR-0009: Use of Aurora PostgreSQL Global Cluster for Test 1 Multiple-Choice Questions**

## **Date:**

2025-02-10

## **Status:**

Accepted

## **Context**

Certifiable Inc. is experiencing a significant increase in certification requests due to global expansion and growing demand for software architect licensing. The current database infrastructure for managing multiple-choice questions in Test 1 is unable to efficiently handle the increased workload and ensure high availability and performance. The company needs a cost-efficient, scalable, and reliable database solution to support its operations and enhance the efficiency of managing multiple-choice questions.

The **goal** is to leverage Aurora PostgreSQL Global Cluster to:

1. **Enhance database scalability and performance** for managing multiple-choice questions.
2. **Improve data reliability and availability** through managed database services.
3. **Support AI-driven functionalities** with efficient data storage and retrieval.
4. **Ensure data security and compliance** with industry standards.

## **Decision**

We will adopt **Aurora PostgreSQL Global Cluster** for Certifiable Inc.'s database infrastructure for Test 1 multiple-choice questions. The solution includes:

### **1. Scalability and Performance**

- Use Aurora PostgreSQL Global Cluster to handle increased workload and ensure high performance.
- Leverage Aurora's ability to scale read and write operations to accommodate the growing number of certification requests.

### **2. Reliability and Availability**

- Deploy Aurora PostgreSQL in a Global Cluster configuration to ensure high availability and minimize downtime.
- Utilize automated backups and snapshots to ensure data durability and quick recovery.

### **3. Support for AI-Driven Functionalities**

- Integrate Aurora PostgreSQL with AWS AI services such as Amazon SageMaker for building, training, and deploying machine learning models.
- Use Aurora's capabilities to efficiently store and retrieve data for AI-driven functionalities like automated grading and fraud detection.

### **4. Security and Compliance**

- Implement AWS Identity and Access Management (IAM) for secure access control to Aurora PostgreSQL.
- Use AWS Key Management Service (KMS) for data encryption at rest and in transit.
- Conduct regular security assessments using AWS Security Hub and AWS Inspector to ensure compliance with data privacy regulations.

## **Consequences**

### **Positive Outcomes**

✅ **Scalability:** Aurora PostgreSQL enables seamless scaling to handle increased workload efficiently.
✅ **Performance:** Aurora's capabilities improve the performance of data storage and retrieval for AI-driven functionalities.
✅ **Reliability:** Global Cluster deployments and automated backups ensure high data availability and durability.
✅ **AI Integration:** Aurora's integration with AWS AI services enhances the capabilities of automated grading and other AI-driven functionalities.
✅ **Security:** Robust security measures and compliance with data privacy regulations protect sensitive data.

### **Risks & Mitigation**

⚠ **Risk: Vendor lock-in**
➡ Mitigation: Use a multi-cloud strategy and design the system to be cloud-agnostic where possible.

⚠ **Risk: Cost management**
➡ Mitigation: Implement cost monitoring and optimization tools provided by AWS to manage expenses effectively.

⚠ **Risk: Data privacy concerns**
➡ Mitigation: Ensure compliance with data privacy regulations and use AWS data residency controls.

## **Next Steps**

- **Migrate existing database infrastructure** to Aurora PostgreSQL Global Cluster.
- **Develop and deploy AI models** using AWS AI services integrated with Aurora.
- **Implement scalability and performance mechanisms** using Aurora's features.
- **Conduct security assessments** and ensure compliance with data privacy regulations.
- **Monitor database performance** and optimize as needed.

---