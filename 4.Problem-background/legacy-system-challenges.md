[> Home](../readme.md)

[< Prev](readme)  |  [Next >](ai-integration-opportunity.md)

---

# Legacy System Challenges

The existing certification system of Certifiable Inc. is put under pressure by the expected 5-10x scaleup. Furthermore, generative AI offers more efficient solutions to some of the tasks currently handled manually.


## The challenges of the scale up

- existing expert consultants who provide manual evaluations cannot handle the 5-10x increase in workload
- direct scaleup is slow because employing a large number of new expert consultants takes bandwidth from the existing employees for onboarding
- however deploying an AI based solution also creates additional work for regular checking and validation of model scores
- direct scaleup is likely to temporary decrease the certification quality until the new evaluators got more experience
- scale up in any way is costly, and the proposed solution should ideally increase the margins to cover this cost; the dynamic scaling of AI solution makes it very cost-effective


## Additional challenges of Certifiable Inc. business

The proposed solution should consider these challenges if possible.

- manual evaluation is the largest cost at (3+11)h * $50/h = $550 out of $800 exam fee, that cannot be directly changed (the exam fee is fixed, a consultant's hourly cost is market standard)
- manual evaluation decreases the customer experience with the long feedback cycles (1 week for each part of the test)
- a major challenge in an architect's career is having few opportunities to practice architecture, average at half-a-dosen in a lifetime


## Technologies superseeded by AI-empowered alternatives

- manually updating questions to prevent cheating
- manual support chat (AI can handle typical requests)


## Integration challenges

The largest integration challenge of AI is the cost of new system development and validation, not unlike any other large IT system integration. The cost of running AI can be reduced by new cheaper APIs and efficient self-hosted models, but the integration cost is lower bound by a relatively large amount of work involved in it.

Specific integration challenges are:

- update business workflows to include AI, e.g. implement preliminary question assessment by AI **and** educate the evaluators to use these assessments for faster but equally precise evaluations
- update the tools of evaluators, test maintenance, test analysis for integration with AI
- deploy a global AI model performance analytics platform that includes cost, latency, relevance of model predictions to the final grade as a measure of model performance
- create and implement AI cost optimization system e.g. using dynamic scaling or running on-demand rather than continuously
- deploy an A/B test solution for the evaluation and migration of new AI models
- deploy safeguards against tampering with the AI models, at least tamper detection and warnings visible to the evaluators



### **Tasks**
* [X] Identify bottlenecks in the legacy system
* [X] Document system performance issues
* [X] Highlight security vulnerabilities
* [X] Identify high-maintenance components
* [X] List outdated technologies
* [X] Assess integration challenges
* [X] Evaluate user dissatisfaction and feedback


---

[< Prev](readme)  |  [Next >](ai-integration-opportunity.md)
