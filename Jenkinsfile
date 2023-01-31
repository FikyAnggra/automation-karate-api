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
//         stage('Build') {
//             steps {
//                 //Menjalankan perintah Maven untuk membangun proyek
//                 bat 'mvn clean install'
//             }
//         }
        //Tahap ketiga bernama "Test"
        stage('Test') {
            steps {
                //Menjalankan tes menggunakan Maven
                bat 'mvn test -Dtest=TestRunnerProearn#Regression'
            }
        }
        stage('Notify Discord') {
            steps {
                // send message to Discord
                script {
                    def webhookURL = "https://discordapp.com/api/webhooks/1069944985425813514/b9YiaaPSxha5_xyIzLd1R8-a85Um8wT4Y0OWxeoPU6EdVqv-gfFV6-2KwG4I9kHBXZNH/MTA2OTk1MTE0MjY3MjQ2NjA2Mg.GCW0qX.qO_gGQA6bA0EHLQVlVtaR_27Y_d4f_c1NwDsY8"
                    def message = """
                    Build ${env.BUILD_NUMBER} is complete!
                    Build status: ${currentBuild.currentResult}
                    """
                    bat "curl -X POST -H 'Content-Type: application/json' -d '{\"content\":\"${message}\"}' ${webhookURL}"
                }
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
