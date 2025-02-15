# Test 2

The role of the second test is to evaluate the candidate's ability to design good software architectures. This task does not have a single correct answer. The quality of the proposed architecture is evaluated manually within 1 week response time, taking on average 8 hours of work.


## Proposed solution to Test 2

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
