[> Home](../readme.md)

[< Prev](../readme.md)  |  [Next >](../2.Business-goals/readme)

---

# Overview

Certifiable, Inc. is a market leader in software architecture certification. The rapid expansion of mandatory software
architect licensing laws across the U.K., Europe, and Asia has led to a significant increase in demand, estimated at
5-10 times the current certification volume. The existing manual grading and administrative processes are not scalable
to meet this demand.

The goal of this project is to integrate **Generative AI** into the **SoftArchCert** system to enhance certification
processing, improve candidate experience, streamline administrative workflows, and ensure high credibility in
certification validation. AI will play a pivotal role in **automating grading, providing candidate support, and optimizing test administration**, while ensuring accuracy, fairness, and scalability.

The **AI-Enhanced Certification System** modernizes Certifiable, Inc.’s **SoftArchCert** platform by integrating AI to
handle a **5-10X increase in certification demand** through automated grading, candidate support, and test optimization.
AI assists in **grading Test 1 (Aptitude) and providing preliminary analysis for Test 2 (Architecture Submission)**
while ensuring human expert oversight. A **24/7 AI chatbot** and **personalized study recommendations** enhance the
candidate experience, while AI-driven **test analysis** improves question quality and generates new case study
variations. Additionally, AI-powered **certification verification** streamlines validation for HR teams. This
**scalable, cost-efficient AI-human hybrid system** enhances accuracy, efficiency, and fairness, reinforcing
**Certifiable, Inc.'s** position as a leader in software architecture certification.

## Video Presentation 
[![Video Presentation on AI Based Solutions](https://img.youtube.com/vi/3ylwsr-H2U8/0.jpg)](https://www.youtube.com/watch?v=3ylwsr-H2U8)

## Diagrams

[Process Flow](../6.Diagrams/Future%20State/scenario-based-flow-diagrams.drawio.svg) | 
[Overall Architecture](../6.Diagrams/Future%20State/overall-impl-architecture.drawio.svg) | [AI Architecture](../6.Diagrams/Future%20State/ai-architecture.png)

## Ai Solutions C4 Diagrams

### System Context

![System Context](../6.Diagrams/Future%20State/C4/structurizr-SystemContext.png)

### Container View
![Containers](../6.Diagrams/Future%20State/C4/structurizr-Container.png)

### Apptitude Test Component
![Apptitude Test](../6.Diagrams/Future%20State/C4/structurizr-ApptitudeTest.png)

### Case Study Test Component
![Casestudy](../6.Diagrams/Future%20State/C4/structurizr-CaseStudyService.png)

### Fraud Detector Component
![Fraud etector](../6.Diagrams/Future%20State/C4/structurizr-FraudDetector.png)

### Score Review Requestor Component
![Score Review](../6.Diagrams/Future%20State/C4/structurizr-ScoreReviewRequestorService.png)

### Audit Component
![Audit](../6.Diagrams/Future%20State/C4/structurizr-ScoreAuditService.png)

### Administration Service Component
![Containers](../6.Diagrams/Future%20State/C4/structurizr-AdministrationService.png)

### Certificate Validator Component
![Certificate Validator](../6.Diagrams/Future%20State/C4/structurizr-CertificationValidatorService.png)


## Project Scope

The AI enhancements will focus on:

- **Automated Grading**
  - AI-assisted grading for short-answer questions in the **Aptitude Test (Test 1)**.
  - AI-assisted evaluation and preliminary feedback for the **Architecture Submission (Test 2)**.

- **Candidate Support**
  - AI-driven **chatbot** for 24/7 assistance.
  - AI-generated **personalized study recommendations** and targeted practice materials.

- **Administrative Efficiency**
  - AI-driven **test analysis and question optimization**.
  - AI-generated **case study variations** to prevent content leakage.

## Stakeholders

- **Candidates** – Software architect candidates, the primary users of the certification system.
- **Examiners** – Expert software architects responsible for grading and test maintenance.
- **HR & Employers** – Verify certification authenticity for hiring.
- **Administrators** – Manage and oversee AI-driven certification workflows.
- **Certifiable, Inc. Executive Team** – Ensure system scalability, business alignment, and certification integrity.

## Use Cases

### 1. **Automated Grading**
- Candidates complete **Test 1 (Aptitude Test)** with AI-assisted short-answer grading.
- AI flags edge cases for **expert review** to ensure accuracy.
- AI provides **preliminary feedback** on **Test 2 (Architecture Submission)** before final expert grading.

### 2. **AI-Powered Candidate Support**
- Candidates receive **real-time assistance** via an AI chatbot.
- AI provides **customized study material recommendations** based on performance analytics.

### 3. **AI-Driven Administrative Enhancements**
- AI analyzes candidate responses to **improve test questions**.
- AI generates **new case study variations** for Test 2 to prevent content leaks.

## Benefits

- **Scalability** – AI enables handling **5-10X growth** in certification requests.
- **Efficiency** – Reduces grading time from **3 hours (Test 1) and 8 hours (Test 2)** per candidate.
- **Candidate Experience** – Personalized study recommendations and 24/7 chatbot assistance.
- **Certification Validation** – AI automates verification for HR teams.
- **Cost Optimization** – AI is **used on-demand** rather than continuously to control expenses.

## Challenges

- **Accuracy & Reliability** – AI must **match expert grading quality** to avoid certification disputes.
- **Cost Management** – AI processing must balance API access to **proprietary LLMs** (e.g., OpenAI, Anthropic) vs. **self-hosted open-source** LLMs (e.g., Llama, Mistral) to optimize costs while maintaining performance and scalability.
- **AI Governance & Ethics** – AI decisions must be **transparent, fair, and unbiased**.
- **Change Management** – Transitioning expert graders to an **AI-supported workflow**.

## Success Criteria

- **95%+ grading accuracy** matching expert evaluation.
- **50%+ reduction in grading time** for short-answer and architectural solutions.
- **Seamless AI-assisted candidate support** improving user experience.
- **Scalable AI implementation** handling increased certification demand.


---

[< Prev](../readme.md)  |  [Next >](../2.Business-goals/readme)
