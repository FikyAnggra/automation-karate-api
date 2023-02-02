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
//                 def xmlReport = readFile('target/surefire-reports/TEST-api.proearn.TestRunnerProearn.xml')
//                 def report = new XmlSlurper().parseText(xmlReport)

//                 def elapsed = report.testsuite.@time
//                 def threads = report.testsuite.@threads
//                 def threadTime = report.testsuite.@time / report.testsuite.@threads
//                 def features = report.testsuite.@tests
//                 def skipped = report.testsuite.@skipped
//                 def efficiency = report.testsuite.@tests / report.testsuite.@threads
//                 def scenarios = report.testsuite.@tests
//                 def passed = report.testsuite.@tests - report.testsuite.@failures
//                 def failed = report.testsuite.@failures

//                 def content = 
//                     """
//                         Karate version: 1.1.0
//                         ======================================================
//                         elapsed: ${elapsed} | threads: ${threads}  | thread time: ${threadTime}
//                         features: ${features}   | skipped: ${skipped}  | efficiency: ${efficiency}
//                         scenarios: ${scenarios}  | passed: ${passed}  | failed: ${failed}
//                         ======================================================
//                     """
//                 echo "result HTML ${content}"
//                     def result = readFile('target/surefire-reports/api.proearn.TestRunnerProearn.txt')
// //                     def hasil = result.split(",")
               
                    def resulthtml = readFile('target/karate-reports/karate-summary-json.txt')
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
                def hasil = resulthtml.split(/[\{\[{\}\}],\},\[\]]/)
                    for (int i = 0; i < hasil.size(); i++) {
                        def subhasil = hasil[i].split(",")
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
                        echo "result ke ${i} ${hasil[i]}" 
//                         for (int j = 0; j < subhasil.size(); j++) {
//                                 echo "sub result ke ${j} ${subhasil[j]}" 
//                         }
                    }
                
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
