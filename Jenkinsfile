pipeline{
    agent any
    tools{
        maven 'maven_3_9_10'
    }
    environment{
        PATH = "/usr/local/bin:/opt/homebrew/bin:$PATH" // adjust as needed
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mithunghosh88/springboot-docker-jenkins-integration']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t mithunghoshsd/spring-boot-docker .'
                }
            }
        }
        stage('Push image to Docker hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u mithunghoshsd -p ${dockerhubpwd}'
                    }
                    sh 'docker push mithunghoshsd/spring-boot-docker'
                } 
            }
        }
    }
}