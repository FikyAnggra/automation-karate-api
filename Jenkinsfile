//Mendefinisikan pipeline
pipeline {
    //Menetapkan agen sebagai 'any', yang berarti bisa dijalankan pada agen yang tersedia
    agent any
    
    //Mendefinisikan tahap-tahap dalam pipeline
    stages {
        //Tahap pertama bernama "Clone repository"
        stage ('Clone Repository') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/FikyAnggra/automation-karate-api.git']]])
            }
        }

        //Tahap kedua bernama "Build"
        stage('Build') {
            steps {
                //Menjalankan perintah Maven untuk membangun proyek
//                 discordSend description: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", footer: "Start Build", link: "$BUILD_URL", result: currentBuild.currentResult, title: JOB_NAME, webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
                echo "test"
                }
        }
        //Tahap ketiga bernama "Test"
        stage('Test') {
            steps {
                //Menjalankan tes menggunakan Maven
//                 bat 'mvn test -Dtest=TestRunnerProearn'
//                 script {
//                     def result = readFile('target/karate-reports/karate-summary-json.txt')
//                     def featuresPassed = getContext(result) //{ it.startsWith("featuresPassed") }
//                     echo "featuresPassed: ${featuresPassed}"
//                       if (featuresPassed) {
//                         featuresPassed = featuresPassed.split(':')[1].trim()
//                       } else {
//                         featuresPassed = 'Tidak ditemukan'
//                       }
//                       echo "featuresPassed: ${featuresPassed}"
//                 }
                echo 'test'
//                 discordSend description: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: JOB_NAME, webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
                
    
            }
        }
//         stage('Notify Discord') {
//             steps {
//                 // send message to Discord
//                 script {
// //                     def webhookURL = "https://discordapp.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
// //                     def message = """
// //                     Build ${env.BUILD_NUMBER} is complete!
// //                     Build status: ${currentBuild.currentResult}
// //                     """
// //                     bat "curl -X POST -H 'Content-Type: application/json' -d '{\"content\":\"${message}\"}' ${webhookURL}"
//                     discordSend description: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", footer: "Start Build", link: "$BUILD_URL", result: currentBuild.currentResult, title: JOB_NAME, webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
//                 }
//             }
//         }
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
                
//                 def resulthtml = readFile('target/karate-reports/karate-summary-json.txt')
//                 def value = $(echo $resulthtml | jq '.featuresPassed')
//                 echo "Value: $value"
                
                    def resulthtml = readFile('target/karate-reports/karate-summary-json.txt')
                    def json = new groovy.json.JsonSlurper().parseText(resulthtml)
                    def featuresPassed = json.featuresPassed
                    def featuresFailed = json.featuresFailed
                    def totalTime = json.totalTime
                    def featuresSkipped = json.featuresSkipped
                    def resultDate = json.resultDate
                    def scenariosPassed = json.scenariosPassed
                    def scenariosFailed = json.scenariosfailed
                    def featureSummary = json.featureSummary
                    
//                     def failed = json.featureSummary.failed
                    for (int i = 0; i < featureSummary.size(); i++) {
                        def durationMillis = json.featureSummary.durationMillis
                        def name = json.featureSummary.name
                        def scenarioCount = json.featureSummary.scenarioCount
                        def passedCount = json.featureSummary.passedCount
                        def failedCount = json.featureSummary.failedCount
                        def messageScenario = 
                            """
                            ============================================================
                                               Automation Karate API
                                                  Feature Summary
                            ============================================================
                            Feature Name        = ${name[i]} 
                            Running Time        = ${durationMillis[i]} m/s
                            Total Scenario      = ${scenarioCount[i]}
                            Scenario Passed     = ${passedCount[i]}
                            Scenario Failed     = ${failedCount[i]}
                            ============================================================
                            """
//                         echo "${messageScenario}"
//                         discordSend webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
                        discordSend description: "${messageScenario}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
                    
                    }
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
//                        echo "${messageAllFeature}"
//                     discordSend description: "${messageAllFeature}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
                    
                    
                
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
