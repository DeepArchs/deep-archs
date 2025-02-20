[> Home](../readme.md)

[< Prev](readme)  |  [Next >](../6.Diagrams/readme.md)

---

# Guardrails

Generative AI models are inherently stochastic because of their initialization, randomness in training process, "randomness" of the huge training data collections, and randomness or "temperature" in generation. Guardrails ensure that AI output matches the business requirements for reliability and quality of predictions.


## Model validation

The basic prerequsite of deploying any AI model in production is its validation. The model grading performance is validated on a large set of manually graded data, or a combined set of manually graded data and data graded by a second production-quality model.

The model performance criterion is RMSE (root mean squared error) between the model grades and the ground truth. This criterion penalizes large deviations while giving less significance to small deviations between the gradings. The actual RMSE threshold for the production-grade AI models is found based on the difference between the candidate acceptances based on manual and model grading; the difference should be below the business-driven threshold (e.g. 1%).


## Model continuous validation

In additional to the initial validation, all AI models deployed into production are continuously validated. The ground truth gradings are created by manually grading a small portion (~5%) of all answers. Significant deviation in grading performance leads to the AI model being taken off the production deployment, and replaced by another validated candidate model or temporarily by manual grading. Continuous model validation is connected to an alerting mechanism, and is checked on the regular operations review meetings.



### **Tasks**
* [ ] Define Architectural Principles & Constraints
* [ ] Establish Security & Compliance Guardrails
* [ ] Set Performance & Scalability Benchmarks
* [ ] Define Quality Assurance & Testing Standards
* [ ] Develop Data Governance & Management Policies
* [ ] Implement AI-Specific Guardrails
* [ ] Define Integration & Deployment Guardrails
* [ ] Set Up Monitoring, Logging, & Alerting Mechanisms
* [ ] Develop a Risk Management & Mitigation Framework
* [ ] Conduct Stakeholder Review & Approval
* [ ] Document & Communicate Guardrails
* [ ] Establish Ongoing Review & Update Process



---

[< Prev](readme)  |  [Next >](../6.Diagrams/readme.md)
