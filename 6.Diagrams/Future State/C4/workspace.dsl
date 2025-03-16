workspace "Certifiable Inc" "This is the AI upgrade of the Testing Platform and its Ancilliaries for Certifiable Inc" {

    model {

        examineeUser = person "Certification Candidate User" "Person Taking Test 1 and 2, to get certified."

        examinerUser = person "Examiner User" "Architects who evaluates Tests submitted by Aspirants."

        adminUser    = person "Admin User" "Esatblished Architects who are Adminastrators."

        hrUser       = person "HR User" "External Business Users or HR personnels who needs to validate the candidate certificates."
    
        certSystem   =  softwareSystem "Certification System" "Certifiable Inc software sytem to administer architecture certification process." {
            appTest = container "Apptitude Test Service" {
                tags "Application"
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
       
    }
    
}