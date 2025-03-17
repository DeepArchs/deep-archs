workspace "Certifiable Inc" "This is the AI upgrade of the Testing Platform and its Ancilliaries for Certifiable Inc" {

    model {

        examineeUser = person "Certification Candidate User" "Person Taking Test 1 and 2, to get certified."

        examinerUser = person "Examiner User" "Architects who evaluates Tests submitted by Aspirants."

        adminUser    = person "Admin User" "Esatblished Architects who are Adminastrators."

        hrUser       = person "HR User" "External Business Users or HR personnels who needs to validate the candidate certificates."
    
        certSystem   =  softwareSystem "Certification System" "Certifiable Inc software sytem to administer architecture certification process." {
            appTest = container "Apptitude Test Service" {
                tags "Application"
                apiGateway = component "API Gateway"
                test1Service = component "Test 1 Generator ASG K8S"
                mcDB = component "Aurora Global Cluster Postgres DB" {
                    tags "Database"
                    description "Storing the multiple choice answer responses"
                }
                saDB = component "Amazon Neptune DB" {
                    tags "Database"
                    description "Storing Answers to Short Questions"
                }
                agSvc = component "Auto Grading ASG K8S" {
                        description "Auto evaluates the multiple choice questions"
                        }
                smSvc = component "Amazon Sagemaker" {
                        description "Using the fine tuned Llama model evaluates the short answer questions"
                }
                sgSvc = component "Score Generator ASG K8S" {
                        description "Evalutaes the confidence score returned by Sagemaker and translates it into candidate score"
                }
                rgSvc = component "Result Generator ASG K8S" {
                        description "Consolidates the multiple choice and short answer scores and generates candidate score for Test1"
                }
                rqSQS = component "SQS Result Queue" {
                        description "Sends result in candidate feed"
                }
                rtSNS = component "SNS Result Topic" {
                    description "Triggers email to candidates with result details for Test 1"
                }
                
                
                
            }
            caseStudy = container "Case Study Test Service" {
                tags "Application"
                elgbltyDB = component "Amazon Aurora Global Cluster\n Postgres DB"
                apiGW     = component "API Gateway"
                testDownl = component "Test Downloader AGS K8S" {
                    description "Selects and sends case study question to candidates"
                }
                qDB       = component "Aurora GC Postgres DB" {
                    tags "Database"
                    description "Case Study Question Repository"
                }
                intakeSvc = component "Submission intake ASG K8S"
                s3Store   = component "AWS S3 \n stores all candidate submissions"
                ragScorer = component "AWS Sagemaker"
                scAgg     = component "Candidate Score Generator ASG K8S" {
                    description "Uses RAG, fine trained Llama and Neptune DB to evaluate casestudy and generate confidence poiints on each pre engineered prompts"
                }
                finScSNS  = component "SNS \n Case Study Score Topic"
                certDB    = component "Aurora Global Cluster Postgres DB" {
                    tags "Database"
                    description "Certified Candidates DB"
                }
            }
            scoreReview = container "Score Review Service" {
                tags "Application"
            }
            testAudit = container "Audit Service" {
                tags "Application"
            }
            fraudDetector = container "Fraud Detector Service" {
                tags "Application"
                
                s3Storage = component "Amazon S3" {
                    tags "Start"
                    description "START \n S3 - Stores all Test 2 submissions"
                }
                lambdaSvc = component "AWS Lambda Service" {
                    description "Gets event triggered with each new submissions stored in S3"
                }
                aBR = component "Amazon Bedrock" {
                    description "Detects fraud - uses RAG, lexical and semantic search on Neptune DB, which contains all previous submissions, and fine trained Llama"
                }
                expA = component "Expert Allocator ASG K8S" {
                    description "Identifyies and allocates experts or examiners to evaluate Fraud alerts"
                }
                alertSNS = component "AWS SNS"{
                    description "Contains fraud alert topic"
                }
                evalAgg = component "Evaluation Aggregator ASG K8S"{
                    description "Aggregates the evaluation made by examiners"
                }
                evalSNS = component "AWS SNS - Detected Fraud Topic" {
                    description "Holds the final fraud evaluation topic"
                }
                
                
            }
            certValidator = container "Certificate Validator Service" {
                tags "Application"
            }

            adminContainer = container "Admin Service" {
                tags "Application"
            }
        }

        #Containers
        examineeUser -> appTest "Uses to take Apptitude Test"
        examineeUser -> caseStudy "Uses to download and submit case study Test"
        examineeUser -> scoreReview "To request score review"
        examinerUser -> scoreReview "To re-evaluate AI generated score"
        examinerUser -> testAudit "To re-evaluate,  Audit selected tests and compare AI model deviations"
        adminUser    -> adminContainer "To perform admin duties"
        hrUser       -> certValidator "To validate candidate certificates"
        examineeUser -> certValidator " To view certificate"
        examinerUser -> fraudDetector "To validate test  flagged by AI as probbale frauds"

        #Apptitude Test 1 Flow
        examineeUser -> apiGateway "Reaches out to gateway to initiate Test 1"
        apiGateway   -> test1Service "Forwards it to ALB of Autoscaling Test 1 Service"
        test1Service -> mcDB "Stores all mutiple choice question's answers"
        test1Service -> saDB "Stores all short answers"
        mcDB  -> agSvc "Reads all multiple choice answers and stores the score"
        smSvc -> saDB "Reads short answers and generstes confidence score using pre engineered prompts and fine tuned Llama and attachments of the short answers using RAG"
        smSvc -> sgSvc "Forwards the confidence scores of short answers"
        sgSvc -> rgSvc "Translates and sends the confidence scores into Graded Score"
        agSvc -> rgSvc "Forwards the scores of multiple choice"
        rgSvc -> mcDB "Aggregates Scores and stores candidate Test 1 Result"
        rgSvc -> rqSQS "Publishes scores to result queue"
        rqSQS -> rtSNS "Sends result in Test 1 result topic"
        rtSNS -> examineeUser "Sends result to candidate via Email and feeds"
        
        #Case Study Flow
        examineeUser -> apiGW "Sends request to download Test 2"
        apiGW        -> testDownl "Forwards request to Test Downloader Service"
        testDownl    -> elgbltyDB "Requests candidate eligibility record"
        testDownl    -> qDB "Selects case study from question bank"
        testDownl    -> examineeUser "Sends feed to eligible candidates with casestudy link"
        examineeUser -> apiGW "Uploads answer packet"
        apiGW        -> intakeSvc "Send sinfo to intake service"
        intakeSvc    -> elgbltyDB "Validates submission windows"
        intakeSvc    -> examineeUser "Sends submission initial status valid/invalid"
        intakeSvc    -> s3Store "Stores submission packet"
        intakeSvc    -> ragScorer "Evaluate submission request"
        ragScorer    -> scAgg "Sends confidence scores to pre-engineered prompts \n and test evaluation report"
        scAgg        -> CertDB "Calculates and stores final scores and certified status"
        scAgg        -> finScSns "Sends scores and certification status to SNS Topic"
        finScSns     -> examineeUser "Sends email and feed"
        
        
        #Fraud Detection Flow
        s3Storage -> lambdaSvc "Each submission storage in S3 triggers events for lambda"
        lambdaSvc -> aBR "Sends requests with submission details"
        aBr       -> expA "Sends fraud alerts"
        expA      -> alertSNS "Stores alerts in SNS Fraud Alert Topic"
        alertSNS  -> examinerUser "Sends email and feed for examiners"
        examinerUser -> evalAgg "Sends final fraud evaluation"
        evalAgg      -> evalSNS "Sends detected frauds to fraud detected topic"
        evalSNS      -> examineeUser "Sends email and feed to candidate"
        
        
        
    }

    views {
         systemLandscape certSystem "SystemLandscape" {
            include *
            animation {
                certSystem

            }
            autoLayout
            description "The system context diagram for the Certifiable Inc."
            properties {
                structurizr.groups false
            }
        }
        systemContext certSystem "SystemContext" {
            include *
            animation {
                certSystem

            }
            autoLayout
            description "The system context diagram for the Certifiable Inc."
            properties {
                structurizr.groups false
            }
        }
        container certSystem "Container" {
             include *
            animation {
              
            }
            autoLayout
            description "The system container diagram for the Certifiable Inc."
            properties {
                structurizr.groups false
            }
        }
        
        component appTest "ApptitudeTest" {
             include *
            animation {
              
            }
            autoLayout
            description "The system component diagram for the Certifiable Inc."
            properties {
                structurizr.groups false
            }
        }
        
        component fraudDetector "FraudDetector" {
             include *
            animation {
              
            }
            autolayout lr
            description "The system component diagram for the Certifiable Inc."
            properties {
                structurizr.groups false
            }
        }
        
        component caseStudy "CaseStudyService" {
             include *
            animation {
              
            }
            autolayout lr
            description "The system component diagram for the Certifiable Inc."
            properties {
                structurizr.groups false
            }
        }
    

     styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Customer" {
                background #08427b
            }
            element "Bank Staff" {
                background #999999
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Failover" {
                opacity 25
            }
        }
        
    themes https://static.structurizr.com/themes/amazon-web-services-2023.01.31/theme.json
    
    }
    
}