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
            }
            scoreReview = container "Score Review Service" {
                tags "Application"
            }
            testAudit = container "Audit Service" {
                tags "Application"
            }
            fraudDetector = container "Fraud Detector Service" {
                tags "Application"
            }
            certValidator = container "Certificate Validator Service" {
                tags "Application"
            }

            adminContainer = container "Admin Service" {
                tags "Application"
            }
        }

        examineeUser -> appTest "Uses to take Apptitude Test"
        examineeUser -> caseStudy "Uses to download and submit case study Test"
        examineeUser -> scoreReview "To request score review"
        examinerUser -> scoreReview "To re-evaluate AI generated score"
        examinerUser -> testAudit "To re-evaluate,  Audit selected tests and compare AI model deviations"
        adminUser    -> adminContainer "To perform admin duties"
        hrUser       -> certValidator "To validate candidate certificates"
        examineeUser -> certValidator " To view certificate"
        examinerUser -> fraudDetector "To validate test  flagged by AI as probbale frauds"

        examineeUser -> apiGateway "Reaches out to gateway to initiate Test 1"
        apiGateway   -> test1Service "Forwards it to ALB of Autoscaling Test 1 Service"
        test1Service -> mcDB "Stores all mutiple choice question's answers"
        test1Service -> saDB "Stores all short answers"
        agSvc -> mcDB "Reads all multiple choice answers and stores the score"
        smSvc -> saDB "Reads short answers and generstes confidence score using pre engineered prompts and fine tuned Llama and attachments of the short answers using RAG"
        smSvc -> rgSvc "Forwards the scores of short answers"
        agSvc -> rgSvc "forwards the scores of multiple choice"
        rgSvc -> mcDB "Aggregates Scores and stores candidate Test 1 Result"
        rgSvc -> rqSQS "Publishes scores to result queue"
        rqSQS -> rtSNS "Sends result in Test 1 result topic"
        rtSNS -> examineeUser "Sends result to candidate via Email and feeds"
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
            description "The system context diagram for the Certifiable Inc."
            properties {
                structurizr.groups false
            }
        }
        
        component appTest "ApptitudeTest" {
             include *
            animation {
              
            }
            autoLayout
            description "The system context diagram for the Certifiable Inc."
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