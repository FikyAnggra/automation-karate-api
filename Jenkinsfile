//Mendefinisikan pipeline
pipeline {
    //Menetapkan agen sebagai 'any', yang berarti bisa dijalankan pada agen yang tersedia
    agent any
    
    //Mendefinisikan tahap-tahap dalam pipeline
    stages {
        //Tahap pertama bernama "Clone repository"
        stage('Clone repository') {
            steps {
                //clone repository dari GitHub
                git 'https://github.com/FikyAnggra/automation-karate-api.git'
            }
        }
        //Tahap kedua bernama "Build"
//         stage('Build') {
//             steps {
//                 # Menjalankan perintah Maven untuk membangun proyek
//                 sh 'mvn clean install'
//             }
//         }
        //Tahap ketiga bernama "Test"
        stage('Test') {
            steps {
                //Menjalankan tes menggunakan Maven
                sh 'mvn test -Dtest=TestRunnerProearn'
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
