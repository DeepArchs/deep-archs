# **ADR-0004: AI-Generated Case Study Variations**

**Date:** 2025-02-19

## **Status**

Proposed

## **Context**

The certification system requires candidates to complete a case study as part of **Test 2 (Architecture Submission)**.
However, static case study assignments lead to the risk of **question leaks, plagiarism, and predictability**, reducing
the effectiveness of the certification. Manually updating case studies is labor-intensive and does not scale with the
anticipated **5-10X increase** in certification demand.

To address these issues, **AI-generated variations of case studies** have been proposed. This approach leverages
**Generative AI** to automatically create multiple variants of a case study, ensuring that candidates receive unique but
equivalent assignments that evaluate the same architectural competencies.

## **Decision**

We will implement **AI-generated case study variations** with the following considerations:

- AI will generate **alternative case studies** by rewording existing ones while maintaining their **core architectural
  evaluation criteria**.
- AI-generated case studies will be **reviewed and approved** by expert software architects before being included in the
  test bank.
- Case study variations will be stored in a **centralized test database**, ensuring each candidate gets a randomized but
  equivalent assignment.
- The system will **track and log** AI-generated content for **auditability and quality assurance**.
- AI-generated variations will align with **the latest industry trends** to keep the test relevant.

## **Consequences**

### **Positive Impacts**

* [X] Reduces the risk of **cheating and question leaks** by ensuring that no two candidates receive identical case
  studies.
* [X] **Scales efficiently** to support global certification demand without increasing manual workload.
* [X] **Maintains fairness** by ensuring all generated case studies are equivalent in difficulty.
* [X] Allows **faster updates** to certification materials to reflect new architectural trends.

### **Potential Risks & Mitigation**

**Risk:** AI-generated case studies may introduce **ambiguities or inconsistencies**.  
**Mitigation:** All AI-generated content will undergo **human expert validation** before deployment.

**Risk:** AI variations might inadvertently alter the complexity of a case study, making some easier or harder than
others.  
**Mitigation:** Case study variations will be **benchmarked and tested** to ensure difficulty parity.

**Risk:** Candidates might challenge AI-generated case studies as being **unclear or unfair**.  
**Mitigation:** Candidates can submit feedback, and flagged case studies will be reviewed and refined by human experts.

## **Next Steps**

- Develop an **AI pipeline** to generate case study variations.
- Define a **review and approval workflow** for AI-generated content.
- Implement **logging and version control** for tracking AI-generated case studies.
- Establish a **candidate feedback mechanism** for continuous improvement.

