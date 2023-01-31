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
                discordSend description: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", footer: "Start Build", link: "$BUILD_URL", result: currentBuild.currentResult, title: JOB_NAME, webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
            }
        }
        //Tahap ketiga bernama "Test"
        stage('Test') {
            steps {
                //Menjalankan tes menggunakan Maven
//                 bat 'mvn test -Dtest=TestRunnerProearn'
                script {
                    def result = readFile('target/karate-reports/karate-summary-json.txt')
                    def jsonContent = readJSON text: result
                    def featuresPassed = jsonContent.featuresPassed
                    echo "testRun ${featuresPassed}"
                }
                
                discordSend description: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: JOB_NAME, webhookURL: "https://discord.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH"
    
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
    //Bagian post akan dijalankan setelah tahap-tahap selesai
//     post {
//         //Menambahkan hasil tes JUnit ke Jenkins
//         always {
//             junit 'target/surefire-reports/**/*.xml'
//         }
//     }
    
}
