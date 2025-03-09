
# Video script


## AI Script

Creating a 5-minute video that presents a new software architecture using Amazon's "working backwards" principle involves focusing on customer needs and clearly explaining how the architecture addresses these needs. Here’s a structured guideline for your video:

We are internal architects, trying to sell the idea to our own business.

**How to make:** ask AI to create small chunks of a video.


## [Opening Scene – 0:00-0:30]

Visuals: Engaging animation or graphics showing a customer-focused environment

Narrator:
"Welcome to [Your Company/Team Name], where innovation is driven by your needs. Today, we unveil our latest software architecture designed to transform how you [specific benefit related to the architecture]."

- intro to AI
- people working --> machines working, people service machines


## [Scene 1: Define Customer Needs – 0:30-1:00]

Visuals: Customers facing challenges, infographics highlighting pain points

Narrator:
"Before we started designing, we asked ourselves: What are the biggest challenges our customers face today? We listened to [specific problems] and identified key areas for improvement: [list 2-3 major pain points]."

Quote from CEO: "Change is hard on its own, and keeping the grading quality consistent while hanging is even harder."

On-screen text: Key customer pain points

- static scale up 5-10x, impossible with current resources
- dynamics of scale up fast enough (hiring, reduced bandwidth while growing, smooth transition)
- keep consistent quality while changing the business
- paying for the scale up, margins are thin at the moment
- heard about AI but how to make it happen consistently, reliably, maintaining the control?


## [Scene 2: Present the Solution – 1:00-2:30]

Visuals: Transition to technical diagrams, flowcharts of the new architecture, animations demonstrating core features

Narrator:
"Our response is a groundbreaking software architecture that [briefly describe the core function]. By leveraging [mention any technologies, e.g., microservices, cloud computing], we've built a system that is [mention key attributes like scalable, secure, efficient]."

Technical Explanation:

Scalability: "Our architecture scales effortlessly with your business, thanks to [specific technology or method]."
Security: "Security is foundational, with [describe security features]."
Performance: "Optimized for speed and reliability, our system delivers [describe performance benefits]."
Interview Clip:
Lead Architect (on-screen):
"This architecture allows us to integrate seamlessly with existing systems and adapt to future needs, ensuring your operations are always at the forefront of innovation."

--------

- general approach 1: AI is good at simple tasks, bad at complex tasks
- general approach 2: divide and conquer, split grading into simple tasks and handle each one separately
- general approach 3: ensure highest grading quality locally (per-task) and globally (per-applicant)

- tasks: a question or a grading aspect of task 2
- keep a larger pool of questions or grading dimensions than necessary, to enable smooth rotation
- AI task workflow:
    1. introduce a new task or a new grading dimension
    2. deploy to a small share of students and grade manually
    3. deployment eval: run AI system in parallel until it reaches "X" performance metric; do prompt tuning at same time
    4. switch grading to AI; if AI system never stabilizes then goto 6
    5. continuous eval: keep manually grading a small part of submissions, check AI system performance over time
    6. sunset: obsolete question or poor AI performance --> replace question with another
- global system eval:
    1. send 5% students to manual evaluation
    2. 4% are with the largest AI uncertainty (sample from the decision boundary of Certifiable Inc "function")
    2. compare per-task performance and whole system performance
    3. investigate differences, add new questions of grading aspects that open up these differences
- question variations: propose few different formulations for the same question, grade with the same AI system
- fraud detection


## [Scene 3: Customer Impact and Testimonials – 2:30-3:30]

Visuals: Happy customers using the new system, graphs showing improvement metrics

Narrator:
"The impact? [Specific benefit] for our customers. Here’s what a few of them have to say."

Customer Testimonial Clips:

Customer 1 (on-screen): "With [software name], we've seen a [specific improvement], making our workflow smoother and more efficient."

Specific improvements:

- prompts to check for specific parts in the solution document


Customer 2 (on-screen): "The transition was seamless, and the support has been exceptional."

- transition with shifting one question at a time
- use historical evals to test model performance


## [Scene 4: Architecture Details & Trade-Offs – 3:30-4:30]

Visuals: FAQ list, roadmap timeline with future features

Narrator:
"We know you have questions. Here are some we’ve anticipated and addressed:"

On-screen text:

"How does it integrate with existing platforms?"
"What is the cost structure?"
"What support is available?"
Narrator:
"And we’re not stopping here. Our roadmap includes [mention upcoming features or enhancements]."


## [Closing Scene – 4:30-5:00]

Visuals: Company logo, contact information, call to action

Narrator:
"Thank you for joining us on this journey. We’re excited to continue working with you to create the future of [industry or specific area]. For more information, visit [website/contact info]. Let’s build the future together."

This structure ensures that the video remains customer-focused, aligning with the "working backwards" principle while providing enough technical depth to convey the significance and capabilities of the new software architecture.


- info about our team
