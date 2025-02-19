[> Home](../readme.md)

[< Prev](../7.ADRs/readme)  |  [Next >](../9.Conclusion/readme)

---

# Pertinent Implementation Details

[List of Implementation Details](#implementation-details)

Here are the implementation details for deploying LLM-based automated grading systems in Certifiable Inc.


## 1. LLM Mesh provider

An LLM Mesh is a system of managing multiple LLM models in production. It includes model deployment and runtime, cost and performance analysis, support for online and offline experimenting with different models.

Consider these two options:

- AWS SageMaker is an Amazon service for deploying, evaluating, experimenting and monitoring of models including LLMs. It integrates well with the rest of AWS ecosystem (e.g. AWS Bedrock for running foundational models) and the AWS security model. As a general machine learning platform, SageMaker is missing dedicated UI for prompt engineering, but it supports Notebooks that is the most popular development format for scientists.
- LangSmith is a proprietary counterpart to the open source LangChain library. It adds all the model lifecycle management tools on top of the LangChain's model development. LangSmith also has a specialized interface for prompt engineering.


## 2. Offline evaluation setup

The first step in deploying automated LLM grading is evaluating different LLM models on the historical data about tests 1 and 2. Developers and researchers should create an end-to-end test suits that compute model performance and cost in grading the past answers. Then several models are evaluated, and the grading work is split into automatically processed and manually processed. Research work continues on improving AI solution for the currently manually processed part.


## 3. Continuous validation of deployed AI models

The quality of AI model gradings can vary over time with new answers of the candidates, and with the changes to 3rd party LLM models used as a service. AI model performance is continuously validated by comparing to manual gradings on a small portion (~5%) of all questions.

The same process helps evaluate question quality and their ability to discrimiate between the skill level of candidates.


## 4. A/B testing new candidate models

New promising AI models appear over time, and more efficient prompting for the existing models can be developed internally. An A/B test solution gives the ability to validate the performance of these new models, and deploy high performing models to production.


## 5. Gradual rollout of new test questions

New test variants are rolled out gradually over the candidate intake. Brand new qestions lack the ground truth gradings necessary for model performance validation. These gradings are obtained by manually grading the new questions rolled out to a small portion of all candidates. Well performing questions with reliable AI gradings are rolled out to all candidates, while questions with unstable AI grading performance or poor discrimination power are dropped.

The same gradual rollout is applied for the task variants of test 2. A new variant is initially given to a small portion of candidates and is graded manually, until sufficient manual gradings are collected to validate the automatic grading performance of an AI model.


### **Tasks**
* [ ] Document core implementation steps
* [ ] Outline system setup and configuration
* [ ] Define deployment process
* [ ] Establish coding standards and guidelines
* [ ] List development tools and environments
* [ ] Provide integration details
* [ ] Ensure documentation for future maintainability


---

[< Prev](../7.ADRs/readme)  |  [Next >](../9.Conclusion/readme)
