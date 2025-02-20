[> Home](../readme.md)

[< Prev](functional-requirements.md)  |  [Next >](../4.Problem-background/readme.md)

---

# Non-Functional Requirements

Certifiable Inc aims to ensure the system's reliability, security, and maintainability through the following non-functional requirements:

## **Guardrails for AI Prompts**

__*Business Objective:*__ *Enhance the sensitivity of the test to user fraud and prevent manipulations.*

- Proper AI guardrails should be in place to identify and prevent any malicious content submissions by candidates that could modify the prompts or otherwise influence the test score.

## **Decoupling of LLM Models**

__*Business Objective:*__ *Enhance system agility and adaptability.*

- The LLM models may need to be changed in the future as training data becomes outdated. Therefore, a proper decoupling mechanism should be in place to facilitate easier upgrades or changes to the underlying LLM model.

## **Minimizing Hallucinations**

__*Business Objective:*__ *Ensure a sustainable model.*

- Proper checks and balances should be in place to minimize LLM hallucinations.

## **High Availability**

__*Business Objective:*__ *Ensure the system is accessible to users at all times across the globe.*

- The system should be deployed across multiple AWS regions to ensure high availability and minimize downtime.
- Failover mechanisms should be implemented to automatically switch to a backup system in case of a primary system failure.

## **Fault Tolerance**

__*Business Objective:*__ *Ensure the system can continue to operate in the event of a failure.*

- The system should be designed to handle and recover from hardware and software failures without affecting the user experience.
- Redundancy mechanisms should be implemented for critical components to prevent single points of failure.

## **Accuracy of AI Generations**

__*Business Objective:*__ *Ensure the accuracy and reliability of AI-generated content.*

- The AI model's temperature property should be set to ensure deterministic and accurate responses.
- AI models should be regularly validated and updated to maintain high accuracy and relevance.

## **Scalability and Elasticity**

__*Business Objective:*__ *Ensure the system can handle varying loads and scale as needed.*

- The system should automatically scale up or down based on the current load to maintain performance and cost efficiency.
- Services like Auto Scaling and Load Balancing should be used to manage scalability and elasticity.

## **Global Accessibility**

__*Business Objective:*__ *Ensure the system is accessible to users from different geographic regions.*

- Implement content delivery networks (CDNs) to reduce latency and improve access speed for users worldwide.
- Compliance with local regulations and data privacy laws in different regions should be adhered to.

## **User Experience (UX)**

__*Business Objective:*__ *Provide a seamless and intuitive user experience.*

- The system should have a user-friendly interface with clear navigation and responsive design.
- Regular usability testing should be conducted to identify and address any UX issues.

## **Common AI Patterns**

__*Business Objective:*__ *Ensure the system leverages best practices in AI implementation.*

- Common AI patterns such as data preprocessing, model training, and model evaluation should be implemented to ensure consistency and reliability.
- Transfer learning and fine-tuning techniques must be used to improve model performance and reduce training time.

## **AI Anti-Patterns**

__*Business Objective:*__ *Avoid common pitfalls in AI implementation.*

- Overfitting should be avoided by using techniques such as cross-validation and regularization.
- Transparency and explainability should be ensured in AI models to build trust and facilitate debugging.
- Bias in AI models should be monitored and mitigated to ensure fairness and ethical use.

## **Retrieval-Augmented Generation (RAG) Model Considerations**

__*Business Objective:*__ *Enhance the accuracy and relevance of AI-generated content by leveraging external knowledge sources.*

- A robust retrieval mechanism to fetch relevant information from external knowledge bases should be implemented.
- The integration between the retrieval and generation components should be seamless and efficient.
- The knowledge base should be regularly updated to maintain the relevance and accuracy of retrieved information.
- The retrieval process should be monitored and optimized to minimize latency and improve response times.

## **System Reliability and Availability Metrics**

__*Business Objective:*__ *Ensure the system is reliable and available to users at all times.*

To achieve this objective, the following metrics should be established and monitored:

1. **Uptime Percentage**
   - **Definition:** The percentage of time the system is operational and accessible.
   - **Target:** Aim for an uptime of 99.9% or higher.
   - **Measurement:** Use monitoring tools to track system uptime and downtime incidents.

2. **Mean Time Between Failures (MTBF)**
   - **Definition:** The average time between system failures.
   - **Target:** Increase MTBF to reduce the frequency of failures.
   - **Measurement:** Calculate the time elapsed between failures over a specified period.

3. **Mean Time to Repair (MTTR)**
   - **Definition:** The average time taken to repair the system after a failure.
   - **Target:** Decrease MTTR to minimize downtime.
   - **Measurement:** Track the time taken to resolve incidents from detection to resolution.

4. **Failure Rate**
   - **Definition:** The number of failures occurring over a specified period.
   - **Target:** Reduce the failure rate to improve system reliability.
   - **Measurement:** Count the number of failures and divide by the total time period.

5. **Service Level Agreement (SLA) Compliance**
   - **Definition:** The percentage of time the system meets the agreed-upon service levels.
   - **Target:** Achieve 100% SLA compliance.
   - **Measurement:** Compare actual performance against SLA targets.

6. **Incident Response Time**
   - **Definition:** The time taken to respond to a system incident.
   - **Target:** Reduce response time to quickly address issues.
   - **Measurement:** Track the time from incident detection to the start of the resolution process.

7. **System Redundancy**
   - **Definition:** The presence of backup systems to take over in case of primary system failure.
   - **Target:** Ensure critical components have redundancy to prevent single points of failure.
   - **Measurement:** Verify the existence and functionality of redundant systems through regular testing.

8. **Disaster Recovery Time**
   - **Definition:** The time taken to recover the system after a major failure or disaster.
   - **Target:** Minimize disaster recovery time to restore normal operations quickly.
   - **Measurement:** Conduct disaster recovery drills and measure the time taken to achieve full recovery.

## **System Maintainability and Supportability**

__*Business Objective:*__ *Ensure the system can be easily maintained and supported over its lifecycle.*

To achieve this objective, the following actions should be taken:

1. **Modular Architecture**
   - **Definition:** Design the system with a modular architecture to facilitate easier maintenance and updates.
   - **Actions:**
     - Break down the system into smaller, independent modules or components.
     - Ensure each module has a well-defined interface and can be developed, tested, and deployed independently.
     - Use microservices architecture where appropriate to enhance modularity.

2. **Code Quality and Standards**
   - **Definition:** Maintain high code quality and adhere to coding standards to ensure the system is maintainable.
   - **Actions:**
     - Implement coding standards and guidelines for all developers to follow.
     - Conduct regular code reviews to ensure adherence to standards and identify potential issues early.
     - Use static code analysis tools to automatically check for code quality and security issues.

3. **Documentation**
   - **Definition:** Provide comprehensive documentation for the system to facilitate maintenance and support.
   - **Actions:**
     - Document the system architecture, design decisions, and key components.
     - Maintain up-to-date API documentation for all interfaces and services.
     - Provide user manuals and support guides for end-users and support staff.

4. **Automated Testing**
   - **Definition:** Implement automated testing to ensure the system remains reliable and maintainable.
   - **Actions:**
     - Develop a comprehensive suite of automated tests, including unit tests, integration tests, and end-to-end tests.
     - Use continuous integration (CI) tools to automatically run tests on code changes.
     - Ensure high test coverage to catch issues early and reduce the risk of regressions.

5. **Monitoring and Logging**
   - **Definition:** Implement monitoring and logging to facilitate maintenance and troubleshooting.
   - **Actions:**
     - Set up monitoring tools to track system performance, availability, and key metrics.
     - Implement centralized logging to collect and analyze logs from all system components.
     - Use alerting mechanisms to notify support staff of potential issues in real-time.

6. **Change Management**
   - **Definition:** Establish a change management process to ensure controlled and predictable changes to the system.
   - **Actions:**
     - Implement a formal change management process to review and approve changes.
     - Use version control systems to track changes and maintain a history of modifications.
     - Conduct regular release planning and communicate changes to all stakeholders.

7. **Training and Knowledge Transfer**
   - **Definition:** Provide training and knowledge transfer to ensure support staff can effectively maintain the system.
   - **Actions:**
     - Conduct regular training sessions for developers and support staff on system architecture and key components.
     - Maintain a knowledge base with troubleshooting guides, FAQs, and best practices.
     - Encourage knowledge sharing and collaboration among team members.

By ensuring maintainability and supportability, Certifiable Inc can reduce the total cost of ownership, minimize downtime, and ensure the system remains reliable and efficient over its lifecycle.

## **Security and Access Controls**

__*Business Objective:*__ *Ensure the system is secure and access is controlled to protect sensitive data and maintain system integrity.*

To achieve this objective, the following actions should be taken:

1. **Authentication and Authorization**
   - **Definition:** Implement robust authentication and authorization mechanisms to control access to the system.
   - **Actions:**
     - Use multi-factor authentication (MFA) to enhance security.
     - Implement role-based access control (RBAC) to restrict access based on user roles and responsibilities.
     - Regularly review and update access permissions to ensure they align with current user roles.

2. **Data Encryption**
   - **Definition:** Protect sensitive data by encrypting it both at rest and in transit.
   - **Actions:**
     - Use strong encryption algorithms (e.g., AES-256) to encrypt data stored in databases and file systems.
     - Implement TLS/SSL to encrypt data transmitted over networks.
     - Regularly update encryption keys and certificates to maintain security.

3. **Network Security**
   - **Definition:** Secure the network infrastructure to prevent unauthorized access and attacks.
   - **Actions:**
     - Use firewalls to control incoming and outgoing network traffic.
     - Implement intrusion detection and prevention systems (IDPS) to monitor and respond to suspicious activities.
     - Segment the network to isolate critical components and limit the impact of potential breaches.

4. **Security Monitoring and Incident Response**
   - **Definition:** Continuously monitor the system for security threats and have a plan in place to respond to incidents.
   - **Actions:**
     - Set up security information and event management (SIEM) systems to collect and analyze security logs.
     - Implement real-time alerting to notify security personnel of potential threats.
     - Develop and maintain an incident response plan to quickly address and mitigate security incidents.

5. **Vulnerability Management**
   - **Definition:** Regularly identify and address vulnerabilities in the system to prevent exploitation.
   - **Actions:**
     - Conduct regular vulnerability assessments and penetration testing to identify security weaknesses.
     - Apply security patches and updates promptly to address known vulnerabilities.
     - Use automated tools to scan for vulnerabilities and ensure compliance with security policies.

6. **User Training and Awareness**
   - **Definition:** Educate users on security best practices to reduce the risk of human error and social engineering attacks.
   - **Actions:**
     - Conduct regular security training sessions for all users, including developers, administrators, and end-users.
     - Provide guidelines on creating strong passwords, recognizing phishing attempts, and handling sensitive data.
     - Promote a security-aware culture by encouraging users to report suspicious activities and potential security issues.

7. **Access Auditing and Logging**
   - **Definition:** Maintain detailed logs of access and activities to detect and investigate security incidents.
   - **Actions:**
     - Implement logging mechanisms to record user access, system changes, and other critical activities.
     - Regularly review access logs to identify and investigate unusual or unauthorized activities.
     - Use audit trails to track changes and ensure accountability.

By specifying and implementing these security and access controls, Certifiable Inc can protect sensitive data, maintain system integrity, and ensure compliance with security standards and regulations.

## **Legal and Compliance Constraints**

__*Business Objective:*__ *Ensure the system adheres to all relevant legal and regulatory requirements.*

To achieve this objective, the following actions should be taken:

1. **Data Privacy and Protection**
   - **Definition:** Ensure compliance with data privacy laws and regulations such as GDPR, CCPA, and HIPAA.
   - **Actions:**
     - Implement data encryption both at rest and in transit.
     - Ensure user consent is obtained for data collection and processing.
     - Provide mechanisms for users to access, correct, and delete their data.
     - Conduct regular audits to ensure compliance with data protection regulations.

2. **Intellectual Property Rights**
   - **Definition:** Ensure the system respects intellectual property rights and avoids infringement.
   - **Actions:**
     - Use licensed software and third-party components.
     - Implement mechanisms to detect and prevent the use of pirated or unauthorized content.
     - Regularly review and update licenses for software and content used in the system.

3. **Accessibility Compliance**
   - **Definition:** Ensure the system is accessible to users with disabilities, in compliance with standards such as WCAG.
   - **Actions:**
     - Implement accessibility features such as screen reader support, keyboard navigation, and alternative text for images.
     - Conduct regular accessibility testing to identify and address any issues.
     - Provide training for developers and designers on accessibility best practices.

4. **Industry-Specific Regulations**
   - **Definition:** Ensure compliance with industry-specific regulations that may apply to the system.
   - **Actions:**
     - Identify relevant industry regulations (e.g., FINRA for financial services, FDA for healthcare).
     - Implement necessary controls and processes to comply with these regulations.
     - Conduct regular audits and assessments to ensure ongoing compliance.

5. **Security Standards**
   - **Definition:** Ensure the system adheres to recognized security standards such as ISO/IEC 27001, NIST, and SOC 2.
   - **Actions:**
     - Implement robust security measures including firewalls, intrusion detection systems, and regular vulnerability assessments.
     - Develop and maintain an incident response plan to address security breaches.
     - Conduct regular security training for employees and stakeholders.

6. **Legal Documentation and Contracts**
   - **Definition:** Ensure all legal documentation and contracts are in place and up to date.
   - **Actions:**
     - Draft and maintain terms of service, privacy policies, and user agreements.
     - Ensure contracts with third-party vendors include necessary legal and compliance clauses.
     - Regularly review and update legal documentation to reflect changes in laws and regulations.

By identifying and addressing these legal and compliance constraints, Certifiable Inc can ensure the system operates within the bounds of the law and maintains the trust of its users and stakeholders.

---

[< Prev](functional-requirements.md)  |  [Next >](../4.Problem-background/readme.md)