[> Home](../readme.md)

[< Prev](readme)  |  [Next >](../6.Diagrams/readme.md)

---

# Architectural Overview

The [High-Level Architecture](#architectural-overview) of the proposed generative AI solution is shown on the figure below.

![AI architecture](../6.Diagrams/Future%20State/ai-architecture.png)


## Evaluation flow

Candidate answers evaluation follows the same flow for tests 1 and 2. Specific questions of the test 1 or criteria of the test 2 that can be reliably graded by AI are processed automatically. The rest of the questions and criteria are graded manually. In addition, a small part of all submissions (~5%) are graded manually for continuous evaluation of AI models and collection of the ground truth validation data.


## AI deployment flow

AI models are used as complete objects that don't need "training", but they still need prompt engineering (See [Who validates the validators?](../references.md#llm-validators) for more details). After prompt engineering, the model is evaluated on a large corpus of historical answers (see [Model validation](guardrails.md#model-validation)). If the model performance on historical data reaches the business goals, it is deployed to production. Otherwise the model is either discarded or goes back to prompt engineering.

An AI model in production is being continuously validated on the small part of manually graded answers. Anomalies in model performance raise an alert.


### **Tasks**
* [ ] Create high-level architecture diagrams
* [ ] Define system components and their interactions
* [ ] Specify data flow within the system
* [ ] Document key architectural principles
* [ ] Identify dependencies and external services
* [ ] Define system scalability strategy
* [ ] Ensure alignment with security best practices


---

[< Prev](readme)  |  [Next >](../6.Diagrams/readme.md)
