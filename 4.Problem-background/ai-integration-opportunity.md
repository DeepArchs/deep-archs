[> Home](../readme.md)

[< Prev](legacy-system-challenges.md)  |  [Next >](../5.Proposed-solution/readme.md)

---

# AI Integration Opportunity


## Solution rationale

Manual evaluation time is the main pain point in scaling up and the main cost at the same time. The solution will use AI to reduce the amount of evaluation hours spent by applicant, aiming to scale up while keeping the existing expert consultants base. 

The business wants a solution that works 100% of time, for 100% of customers, 100% reliably. Humans work very reliably (say ~99.5%), the edge cases are rare thus can be handled with an established processes at reasonable cost. But the human systems are very expensive, so they always aim to minimize the amount of necessary work, or maximize the impact of one unit of work called "productivity".

AI systems, and Generative AI especially, work differently from manual systems and the business requirements. AI is less reliable so the automated applications must be designed to handle gradings that can be incorrect, but an AI unit of work cost is negligible when compared to a human worker (actual number: one line of code from Copilot is 10^5 times cheaper than from a software engineer). AI application development time can be comparable to the regular software development time if the task is simple, feasible, and uses existing AI models or providers. The main design principle of AI is to have a system where the negative effect of 1 wrong decision does not override the positive effect of 9 correct decisions.

Because of the differences between human and AI based systems, the proposed solution need to change the existing business logic to make it feasible in the AI model. The AI-based evaluation quality would be the same or better than the human evaluation, with an ability to calibrate AI grades and an experimental validation.


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


# Calibration

While not an AI topic, calibration is an important aspect in automatic grading. It ensures that the AI-generated grades stay consistent with the manual grades. Any reliable calibration method would work, the choice depends on the available implementations.

The solution should include some form of continuous calibration, e.g. a small portion of all answers is sent for human evaluation and these evaluations used continuously to keep the model predictions aligned with the human ones.


# Guardrails and tamper prevention

AI models help detecting cheating/plagiarism in Test 2, for example by using embedding methods or an adaptation of RAG that evaluates the submitted solution against the database of previous solutions.

LLMs are suspect to tampering attempts because there is no hard separation between instructions and user input. Prompt Hacking is [easy to implement (see chapter 5)](../references.md#llm-hacks) especially in the short answer questions of the Test 1. Basic tamper prevention may include another LLM that looks for new instructions or question overrides in the answers submitted by a student. This LLM would raise suspicious answers for an extra check by a human evaluator.


# Candidates Support & Feedback Loop

AI decisions can be wrong, so services based on them should include transparency and feedback mechanisms. AI model would write summaries of mistakes from failed answers, that could be shared with the candidates. Grading decisions can be challenged if candidates disagree with the summary of mistakes, or think that the evaluation was wrong.

Some questions can by chance have an inconveniet formulation for AI, causing frequent incorrect gradings. These questions are tracked in the internal feedback loop, and are considered for an updated formulation or replacement by test maintainers.


# Implementation and feasibility

Generative AI is a very simple thing by itself: an open-text query called "prompt" that returns an open-text answer. "Programming" an AI consists of changing the prompt by adding instructions or relevant context information. The basic self-hosted AI models require a suitable machine with a GPU or other AI accelerator hardware, a software library providing an API access to an AI model (multiple free versions exist with highly mature code), and the model weights (multiple versions available, some are free for commercial use). Prompt generation can be done via any programming tools. Thus feasibility is not an issue.

3rd party AI providers offer an API typically priced per unit of input/outgoing text. Some include covenience tools like returning answers in a structured data format. Pricing varies in a very large range, with simpler open source models running on non-mainstream providers being extremely cheap. A study is needed to estimate whether a self-hosted or a cheap API provider model is a better solution.


Cost optimisation is an important part of AI systems, as heavy usage of a 3rd party AI providers could get expensive. There are at least two ways of cost reduction. The most efficient one is evaluating cheaper models, that can be employed if their performance is proven sufficient. The price difference between expensive specialized models and cheap open source deployments can exceed 100x. The second way is prompt and output optimization, reducing the amount of text that goes in and out of a model. AI model computation requirements, and thus costs, relate directly to the amount of incoming and outbounding text. Evaluating alternative prompts uses the same tools as evaluating alternative models, and is judged by the same criteria.


### **Tasks**
* [X] Explore AI-based enhancements
* [X] Identify automation opportunities
* [ ] Assess AI’s impact on business goals
* [X] List potential AI technologies to integrate
* [X] Define expected AI-driven benefits
* [X] Address AI-related risks and limitations
* [X] Determine AI implementation feasibility


---

[< Prev](legacy-system-challenges.md)  |  [Next >](../5.Proposed-solution/readme.md)
