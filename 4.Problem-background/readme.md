[> Home](../readme.md)

[< Prev](../3.Drivers-requirements/non-functional-requirements.md)  |  [Next >](legacy-system-challenges.md)

---

# Problem Background

Certifiable Inc. is challenged to drastically scale up its operations to support an expected 5-10x increase in the number of applications for the Software Architect certification program. The proposed solution is expected to use the recently productionized AI tools at its core. The current certification relies extensively on manual evaluations.


## Challenges

The challenges of the scale up are:

- existing expert consultants who provide manual evaluations cannot handle the 5-10x increase in workload
- direct scaleup is slow and may decrease the certification quality, because employing a large number of new expert consultants takes bandwidth from the existing employees for onboarding
- scale up in any way is costly, and the proposed solution should ideally increase the margins to cover this cost


Additional challenges of Certifiable Inc. that the proposed solution should consider:

- manual evaluation is the largest cost at (3+11)h * $50/h = $550 out of $800 exam fee, that cannot be directly changed (the exam fee is fixed, a consultant's hourly cost is market standard)
- manual evaluation decreases the customer experience with the long feedback cycles (1 week for each part of the test)
- a major challenge in an architect's career is having few opportunities to practice architecture, average at half-a-dosen in a lifetime


## Solution rationale

Manual evaluation time is the main pain point in scaling up and the main cost at the same time. The solution will use AI to reduce the amount of evaluation hours spent by applicant, aiming to scale up while keeping the existing expert consultants base. 

The business wants a solution that works 100% of time, for 100% of customers, 100% reliably. Humans work very reliably (say ~99.5%), the edge cases are rare thus can be handled with an established processes at reasonable cost. But the human systems are very expensive, so they always aim to minimize the amount of necessary work, or maximize the impact of one unit of work called "productivity".

AI systems, and Generative AI especially, work differently from manual systems and the business requirements. AI is unreliable with ~90% correct solutions, but an AI unit of work cost is negligible when compared to a human worker (actual number: one line of code from Copilot is 10^5 times cheaper than from a software engineer). AI application development time can be comparable to the regular software development time if the task is simple, feasible, and uses existing AI models or providers. The main design principle of AI is to have a system where the negative effect of 1 wrong decision does not override the positive effect of 9 correct decisions.

Because of the differences between human and AI based systems, the proposed solution need to change the existing business logic to make it feasible in the AI model. The AI evaluation quality would be the same or better than the human evaluation, with an ability to calibrate AI grades and an experimental validation.


## Proposed solution: Test 1

The role of the first test is to validate that a candidate is familiar with the core concepts of software architecture. This is evident from the fact that a passed test counts towards the next certification attempts. The test has two parts: the multiple choice questions are evaluated automatically, and the short answer questions are evaluated manually with a 1 week response time, taking on average 3 hours of work.

Our vision of an effective AI solution for test 1 works differently from the existing flow, while achieving the same goal of validating the candidate's knowledge of the core software architecture concepts. The test is opened continuously for 30 days and can be taken any number of times. Test evaluation is fully automatic using the existing system for multiple choice questions and an AI judge for the short answer questions, available in near real time (a few minutes). An applicant passes the test once they achieved a high (but not perfect) score at least 3 times, and need to do so within the 30 days to continue to the second test. Every test attempt displays the feedback with scores per question, and a brief summary of why their answer is wrong for each failed question. The test uses multiple versions of the same question formulated in a different way to avoid cheating by memorization; AI helps creating multiple versions of the questions (with human validation).

AI evaluation has multiple implementation, discussed in detail in [TODO].


Summary of the solution features:

- test 1 available for 30 days with unlimited attempts
- test 1 is passed after 3 attempts with a very high (but not perfect) score
- evaluation is fully automatic, done in near real time
- evaluation system provides hints about wrong answers, e.g. a summary of what was wrong or a suggestion to study a specific topic
- evaluation system uses cheap smaller LLM models for automatic assessment because the task of evaluating one question is rather simple
- multiple question versions avoid cheating by making it easier to really learn the concepts instead of memorizing the answers

Solution properties:

- the cost is negligible compared to manual evaluation, because the test uses simpler AI models for the short answer questions
- instant feedback avoids the 1-week evaluation time, improving the user experience
- multiple test attempts help candidates learn the core concepts
- (optional) failing test 1 costs a participant less than $800 improving the user experience
- removing 3h of manual evaluation work helps scaling and improves the margins of Certifiable Inc.


## Proposed solution: Test 2

The role of the second test is to evaluate the candidate's ability to design good software architectures. This task does not have a single correct answer. The quality of the proposed architecture is evaluated manually within 1 week response time, taking on average 8 hours of work.

The solution to the second test is a bunch of documents describing software architecture. This kind of solution cannot be reliably graded by AI at its current level of reasoning. The evaluation criterion of the "good and practical architecture" relies on the hands-on experience of the expert evaluators, and is not formulated precise enough for an AI model to judge the solution against. Thus it is impossible to remove human evaluators from the test 2 while keeping an accurate and precise evaluation.

The AI integration opportunity of test 2 is to reduce the time taken by manual evaluation. It is based on an assumption that the long grading time of 8h is partially caused by filling the grading sheet with a large number of standard questions like "Does the solution have Architectural Decision Letters?", "Does the solution describes SLOs?" etc. A powerful AI model can pre-fill the grading sheet with automatically derived answers to these questions, including its confidence level. This can reduce the grading time especially in the clear-cut cases of:

1. most questions are positive with high confidence: likely a professional software architect, manual evaluation consists of validating few AI answers and confirming the qualification
2. many questions are negative with high confidence: likely insufficient qualification, manual evaluation confirms absense of critical parts and rejects the qualification
3. low confidence or indecisive grading sheet: proceed with the full manual evaluation

The use cases 1 and 2 provide the largest time save in the manual evaluation process. The case 3 where an applicant is near the boundary of an accepted skill level provides some time savings in manual evaluation but less than the other two cases. We expect that at the beginning of the scale up the cases 1 and 2 would form the majority of applicants coming from the experienced software architects confirming their status or inexperienced developers entering the software architecture field. Over time the share of the case 3 should increase as more applicants will be new graduates into the software architecture field studying and applying for a certification until they finally pass, but at that time Certifiable Inc will already resolve its business scaling issue.

Summary of the solution features:

- test 2 includes an expert evaluator to have accurate and precise decisions
- AI pre-fills the grading sheet with answers to the standard questions, together with a confidence level

Solution properties:

- AI cost is negligible even at a larger and more expensive model because it runs only once in the certification process
- expected a significant reduction of the manual evaluation time in two edge cases: a highly skilled software architect, an applicant with far insufficient qualification
- the two aforementioned cases are expected to be the majority of cases at the beginning of the scale up, improving the average time saved


# Implementation of AI evaluation systems

Generative AI systems create text output from a given text input. They do not have consciousness or reasoning capabilities, but being trained on huge amounts of human-generated data become exceptional at mimicking human reasoning. Generative AI capabilites are applied to evaluating text answers in a variety of ways.


## Embedding methods

An embedding model is a large language model that does not generate any text, but rather creates a high-dimensional vector for a given piece of text. The vector is random, but vectors for two similar pieces of text would be similar too. While the idea of mapping text into a vector space is old, the modern LLMs implement "similarity by meaning" while older methods are "similarity by word appearance".

A simple evaluation model can grade an answer based on its similarity to a given correct answer. Another approach is to retrieve `n` most similar answers and investigate their grades.


## Retrieval Augmented Generation (RAG)

An "augmented generation" in LLMs adds a piece of text in front of the user's query that serves as a context. A typical case is the chatbot system message like "You are a friendly and helpful assistant. If you don't know an answer then say that you don't know." 

A "retrieval augmented generation" system consists of a database of relevant text pieces (often cut from documents like PDF), their embeddings, a database supporting vector similarity search, and a script. The script takes a query, computes its embedding, then searches for the most similar pieces of text in the database and attaches them as context in front of the query. The final query looks like "Based on this information: (text1), (text2), (text3); Answer the user's question: (question)".

There are numerous technical tricks to improve the system performance, e.g. re-formulate the user's question with LLM to get more precise matching in the vector database, filter and de-duplicate the retrieved pieces, improved methods that process documents into chunks stored in the database, etc.

A notable addition are modern long-context models that can take hundreds of words as context. This can eliminate the need to search for the most relevant information, as all the information can be attached as context. This avoids the probabilistic nature of information retrieval.

A simple evaluation model based on RAG can retrieve most similar answers with their grades to give as context, or can retrieve relevant information from the test 2 submission to answer questions from the grading sheet.


## Few-shot and zero-shot learning

The LLM's ability to mimic reasoning can be used to grade the answers directly. The "zero-shot learning" prompt looks like "You are a professional software architect grading assignments of applicants for the software architect sertification. Based on the question below, grade the applicant's answer on a scale of 1 to 10. Answer only the grade as one number. Question: (question text). Answer: (answer text)." This pattern is called "zero-shot" because the model never sees the correct answer.

A "few-shot learning" would add some examples, like the correct answer to this question, or an example answer for each numerical grade that helps the model to calibrate its grading scale.

Note that the model only simulates the reasoning capabilities, and is easily overwhelmed by multiple requests. Shorter and simpler tasks produce more reliable results, e.g. grading one question at a time instead of all questions at once.


## Calibration

While not an AI topic, calibration is an important aspect in automatic grading. It ensures that the AI-generated grades stay consistent with the manual grades. Any reliable calibration method would work, the choice depends on the available implementations.

The solution should include some form of continuous calibration, e.g. a small portion of all answers is sent for human evaluation and these evaluations used continuously to keep the model predictions aligned with the human ones.



# TODO

[Legacy System Challenges](legacy-system-challenges.md)  
[AI Integration Opportunity](ai-integration-opportunity.md)

* [ ] [Legacy System Challenges](legacy-system-challenges.md#legacy-system-challenges)
* [ ] [AI Integration Opportunity](ai-integration-opportunity.md#ai-integration-opportunity)


### **Tasks**
* [X] Identify current challenges in the system
* [X] Document limitations of the legacy system
* [ ] Analyze historical issues and failures
* [X] Define business pain points
* [X] Determine gaps in existing solutions
* [X] Establish rationale for system improvements
* [ ] Gather insights from stakeholders


---

[< Prev](../3.Drivers-requirements/non-functional-requirements.md)  |  [Next >](legacy-system-challenges.md)
