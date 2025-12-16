pipeline {
     agent any 

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/gititc778/studentapp-python.git', branch: 'master'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t studentapp:v11 .'
            }
        }

        stage('Push to Docker Registry') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockeritc778',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker tag studentapp:v11 $DOCKER_USER/studentapp:v11
                        docker push $DOCKER_USER/studentapp:v11
                    '''
                }
            }
        }


    }
}
