//Mendefinisikan pipeline
pipeline {
    //Menetapkan agen sebagai 'any', yang berarti bisa dijalankan pada agen yang tersedia
    agent any
    
    //Mendefinisikan tahap-tahap dalam pipeline
    stages {
        //Tahap pertama bernama "Build"
        stage('Build') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/FikyAnggra/automation-karate-api.git']]])
           }
        }
        //Tahap kedua bernama "Test"
        stage('Test') {
            steps {
                //Menjalankan tes menggunakan Maven
                //bat 'mvn test -Dtest=TestRunnerProearn'
                echo "test"
            }
        }
    }
    post {
        always {
            script {
//                     def result = readFile('target/surefire-reports/api.proearn.TestRunnerProearn.txt')
// //                   def hasil = result.split(",")
               
//                     def resulthtml = readFile('target/karate-reports/karate-summary-json.txt')
//                     def hasil = resulthtml.split(/[\{\}\[\]]/)
//                     def subhasil = hasil[hasil.size() - 1].split(",")
//                     def message = """
//                     ============================================================
//                                        Automation Karate API
//                                 ${subhasil[7]}
//                                        ${subhasil[4]}
//                     ============================================================
//                     ${subhasil[2]} | ${subhasil[3]} | ${subhasil[6]}
//                     ${subhasil[8]} | ${subhasil[10]}
//                     """
//                 def hasil = resulthtml.split(/[\{\}\[\]\[{\},{\}],]/)
//                     for (int i = 0; i < hasil.size(); i++) {
//                         def subhasil = hasil[i].split(",")
//                         def message = 
//                             """
//                             ============================================================
//                                                Automation Karate API
//                             ============================================================
//                             ${subhasil[0]}
//                             ${subhasil[1]}
//                             ${subhasil[2]}
//                             ${subhasil[3]}
//                             ${subhasil[4]}
//                             ${subhasil[5]}
//                             ${subhasil[6]}
//                             ${subhasil[7]}
//                             ${subhasil[8]}
//                             ============================================================
//                             """
//                         echo "result ke ${i} \n${message}" 
//                         echo "result ke ${i} ${hasil[i]}" 
//                         for (int j = 0; j < subhasil.size(); j++) {
//                                 echo "sub result ke ${j} ${subhasil[j]}" 
//                         }
//                     }
                
                
                
                
                
                
                    def resulthtml = readFile('target/karate-reports/karate-summary-json.txt').toString()
                    def json = new groovy.json.JsonSlurperClassic().parseText(resulthtml)
                    def featuresPassed = json.featuresPassed
                    def featuresFailed = json.featuresFailed
                    def totalTime = json.totalTime
                    def featuresSkipped = json.featuresSkipped
                    def resultDate = json.resultDate
                    def scenariosPassed = json.scenariosPassed
                    def scenariosFailed = json.scenariosfailed
                
                    def messageAllFeature = 
                                """
                                ============================================================
                                                   Automation Karate API
                                ============================================================
                                Running Date        = ${resultDate} 
                                Total Running Time  = ${totalTime} m/s
                                Feature Passed      = ${featuresPassed}
                                Feature Skipped     = ${featuresSkipped}
                                Feature Failed      = ${featuresFailed}
                                Scenario Passed     = ${scenariosPassed}
                                Scenario Failed     = ${scenariosFailed}
                                ============================================================
                                """
                    discordSend description: "${messageAllFeature}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
                    
                    def featureSummary = json.featureSummary
                    for (int i = 0; i < featureSummary.size(); i++) {
                        def durationMillis = json.featureSummary.durationMillis[i]
                        def name = json.featureSummary.name[i]
                        def scenarioCount = json.featureSummary.scenarioCount[i]
                        def passedCount = json.featureSummary.passedCount[i]
                        def failedCount = json.featureSummary.failedCount[i]
                        def messageScenario = 
                                """
                                ============================================================
                                                   Automation Karate API
                                                      Feature Summary
                                ============================================================
                                Feature Name        = ${name} 
                                Running Time        = ${durationMillis} m/s
                                Total Scenario      = ${scenarioCount}
                                Scenario Passed     = ${passedCount}
                                Scenario Failed     = ${failedCount}
                                ============================================================
                                """
                        discordSend description: "${messageScenario}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
                    }
//                     json.each { object ->
// //                         def featureSummary = object.featureSummary
//                         def durationMillis = object.featureSummary.durationMillis
//                         def name = object.featureSummary.name
//                         def scenarioCount = object.featureSummary.scenarioCount
//                         def passedCount = object.featureSummary.passedCount
//                         def failedCount = object.featureSummary.failedCount
//                           def messageScenario = 
//                                 """
//                                 ============================================================
//                                                    Automation Karate API
//                                                       Feature Summary
//                                 ============================================================
//                                 Feature Name        = ${name} 
//                                 Running Time        = ${durationMillis} m/s
//                                 Total Scenario      = ${scenarioCount}
//                                 Scenario Passed     = ${passedCount}
//                                 Scenario Failed     = ${failedCount}
//                                 ============================================================
//                                 """
//                         discordSend description: "${messageScenario}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
//                     }

//                     def featuresPassed = json.featuresPassed
//                     def featuresFailed = json.featuresFailed
//                     def totalTime = json.totalTime
//                     def featuresSkipped = json.featuresSkipped
//                     def resultDate = json.resultDate
//                     def scenariosPassed = json.scenariosPassed
//                     def scenariosFailed = json.scenariosfailed
                    
//                     def featureSummary = json.featureSummary
//                     def durationMillis = json.featureSummary.durationMillis
//                     def name = json.featureSummary.name
//                     def scenarioCount = json.featureSummary.scenarioCount
//                     def passedCount = json.featureSummary.passedCount
//                     def failedCount = json.featureSummary.failedCount
//                     def messageAllFeature = 
//                                 """
//                                 ============================================================
//                                                    Automation Karate API
//                                 ============================================================
//                                 Running Date        = ${resultDate} 
//                                 Total Running Time  = ${totalTime} m/s
//                                 Feature Passed      = ${featuresPassed}
//                                 Feature Skipped     = ${featuresSkipped}
//                                 Feature Failed      = ${featuresFailed}
//                                 Scenario Passed     = ${scenariosPassed}
//                                 Scenario Failed     = ${scenariosFailed}
//                                 ============================================================
//                                 """
//                     discordSend description: "${messageAllFeature}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
                    
//                     def messageScenario = 
//                             """
//                             ============================================================
//                                                Automation Karate API
//                                                   Feature Summary
//                             ============================================================
//                             Feature Name        = ${name} 
//                             Running Time        = ${durationMillis} m/s
//                             Total Scenario      = ${scenarioCount}
//                             Scenario Passed     = ${passedCount}
//                             Scenario Failed     = ${failedCount}
//                             ============================================================
//                             """
//                     discordSend description: "${messageScenario}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
                    
               
                
                
                
              
                    
//                     def failed = json.featureSummary.failed
//                     for (int i = 0; i < featureSummary.size(); i++) {
                        
//                         def messageScenario = 
//                             """
//                             ============================================================
//                                                Automation Karate API
//                                                   Feature Summary
//                             ============================================================
//                             Feature Name        = ${name[i]} 
//                             Running Time        = ${durationMillis[i]} m/s
//                             Total Scenario      = ${scenarioCount[i]}
//                             Scenario Passed     = ${passedCount[i]}
//                             Scenario Failed     = ${failedCount[i]}
//                             ============================================================
//                             """
// //                         echo "${messageScenario}"
// //                         discordSend webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
//                         discordSend description: "${messageScenario}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
                    
//                     }
                    
//                     discordSend description: "${message}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
//                     discordSend description: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: JOB_NAME, webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
                    
            }
        }
    }
    //Bagian post akan dijalankan setelah tahap-tahap selesai
//     post {
//         //Menambahkan hasil tes JUnit ke Jenkins
//         always {
//             junit 'target/surefire-reports/**/*.xml'
//         }
//     }
    
}
