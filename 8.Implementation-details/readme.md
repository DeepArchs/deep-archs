[> Home](../readme.md)

[< Prev](../7.ADRs/readme)  |  [Next >](../9.Conclusion/readme)

---

# Pertinent Implementation Details

[List of Implementation Details](#implementation-details)

Here are the implementation details for deploying LLM-based automated grading systems in Certifiable Inc.


## 1. Choose LLM Mesh provider

An LLM Mesh is a system of managing multiple LLM models in production. It includes model deployment and runtime, cost and performance analysis, support for online and offline experimenting with different models.

Consider these two options:

- AWS SageMaker is an Amazon service for deploying, evaluating, experimenting and monitoring of models including LLMs. It integrates well with the rest of AWS ecosystem (e.g. AWS Bedrock for running foundational models) and the AWS security model. As a general machine learning platform, SageMaker is missing dedicated UI for prompt engineering, but it supports Notebooks that is the most popular development format for scientists.
- LangSmith is a proprietary counterpart to the open source LangChain library. It adds all the model lifecycle management tools on top of the LangChain's model development. LangSmith also has a specialized interface for prompt engineering.


## 2. Setup offline evaluation

The first step in deploying automated LLM grading is evaluating different LLM models on the historical data about tests 1 and 2. Developers and researchers should create an end-to-end test suits that compute model performance and cost in grading the past answers. Then several models are evaluated, and the grading work is split into automatically processed and manually processed. Research work continues on improving AI solution for the currently manually processed part.


## 3. Deploy validated AI grading models to production

## 4. Deploy continuous validation of production AI models

## 5. Deploy A/B test solution for new candidate models


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
