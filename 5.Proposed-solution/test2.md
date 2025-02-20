[> Home](../readme.md)

[< Prev](../4.Problem-background/ai-integration-opportunity.md)  |  [Next >](architectural-overview.md)

---

# Test 2 Solution

The role of the second test is to evaluate the candidate's ability to design good software architectures. This task does
not have a single correct answer. The quality of the proposed architecture is evaluated manually within 1 week response
time, taking on average 8 hours of work.

## Proposed solution to Test 2

There are 5 variants of test 2 that are graded uniformly based on a specific set of criteria. These criteria can be
viewed as "questions" where the answer is containted somewhere among the files and diagrams of the submitted solution.

An automatic grading system would grade each criterion separately, and then deduct the final decision of pass/fail based
on these criteria. The criteria grading can be done by an AI system similar to Test 1, that extracts and uses the
relevant part of the solution as an "answer" to the criterion "question". The information retrieval part is done with
the RAG (retrieval augmented generation) approach. The final decision from graded criteria can be done by a regular
machine learning classifier (non-generative one).

Criteria grading differs from the question grading because of likely more vague description of these criteria. This
uncertainty poses a challenge for an AI system, causing it to produce unstable gradings.
The [recent work](../references.md#llm-validators) suggests an extra step of precise grading criteria formulation that
helps AI understand the logic of the grading and produce stable grades. This is an iterative work that often includes a
significant change to the initial formulations of the criteria.

The practical implementation includes:

- building a UI tool for human test designers to create and validate precise formulations of the grading criteria that
  help AI to produce stable grades
- design the precise formulations of the grading criteria for AI to grade Test 2, and ensure they result in the required
  quality of gradings
- involve human evaluators for the criteria not yet automated to the required quality

See [automatic solution](./automatic-solution.md) for details.

## Alternative solution to Test 2

The solution to the second test is a bunch of documents describing software architecture. This kind of solution cannot
be reliably graded by AI at its current level of reasoning. The evaluation criterion of the "good and practical
architecture" relies on the hands-on experience of the expert evaluators, and is not formulated precise enough for an AI
model to judge the solution against. Thus, it is impossible to remove human evaluators from the test 2 while keeping an
accurate and precise evaluation.

The AI integration opportunity of test 2 is to reduce the time taken by manual evaluation. It is based on an assumption
that the long grading time of 8h is partially caused by filling the grading sheet with a large number of standard
questions like "Does the solution have Architectural Decision Letters?", "Does the solution describes SLOs?" etc. A
powerful AI model can pre-fill the grading sheet with automatically derived answers to these questions, including its
confidence level. This can reduce the grading time especially in the clear-cut cases of:

1. most questions are positive with high confidence: likely a professional software architect, manual evaluation
   consists of validating few AI answers and confirming the qualification
2. many questions are negative with high confidence: likely insufficient qualification, manual evaluation confirms
   absense of critical parts and rejects the qualification
3. low confidence or indecisive grading sheet: proceed with the full manual evaluation

The use cases 1 and 2 provide the largest time save in the manual evaluation process. The case 3 where an applicant is
near the boundary of an accepted skill level provides some time savings in manual evaluation but less than the other two
cases. We expect that at the beginning of the scale up the cases 1 and 2 would form the majority of applicants coming
from the experienced software architects confirming their status or inexperienced developers entering the software
architecture field. Over time the share of the case 3 should increase as more applicants will be new graduates into the
software architecture field studying and applying for a certification until they finally pass, but at that time
Certifiable Inc will already resolve its business scaling issue.

Summary of the solution features:

- test 2 includes an expert evaluator to have accurate and precise decisions
- AI pre-fills the grading sheet with answers to the standard questions, together with a confidence level

Solution properties:

- AI cost is negligible even at a larger and more expensive model because it runs only once in the certification process
- expected a significant reduction of the manual evaluation time in two edge cases: a highly skilled software architect,
  an applicant with far insufficient qualification
- the two aforementioned cases are expected to be the majority of cases at the beginning of the scale up, improving the
  average time saved

## ADR

See [ADR-3](../7.ADRs/0002-test2) 


---

[< Prev](../4.Problem-background/ai-integration-opportunity.md)  |  [Next >](architectural-overview.md)
