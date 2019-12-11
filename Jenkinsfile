def randomResult = new java.util.Random().nextInt(35)
def analysisStatus = 'OK'
def stageERROR = ''

pipeline {
agent any
stages {
    stage('Build') {
        steps {
            echo "branch name: $BRANCH_NAME"
            script {
                analysisStatus = 'OK'
                    if (randomResult == 11) {
                        analysisStatus = 'KO'
                            stageERROR = 'Build'
                    }
            }
            script {
                if (analysisStatus == 'KO') {
                    error 'error in Build'
                }
            }
            echo 'Build status: ' + randomResult
        }
    }
    stage('UnitTest') {
        steps {
            script {
                analysisStatus = 'OK'
                    if (randomResult == 12) {
                        analysisStatus = 'KO'
                            stageERROR = 'UnitTest'
                    }
            }
            script {
                if (analysisStatus == 'KO') {
                    error 'error in UnitTest'
                }
            }
            echo 'Build status: ' + randomResult
        }
    }
    stage('Quality') {
        steps {
            script {
                analysisStatus = 'OK'
                    if (randomResult == 13) {
                        analysisStatus = 'KO'
                            stageERROR = 'Quality'
                    }
            }
            script {
                if (analysisStatus == 'KO') {
                    error 'error in Quality'
                }
            }
            echo 'Quality status: ' + randomResult
        }
    }
    stage('Publish in Nexus') {
        when {
            expression {
                return !env.BRANCH_NAME.startsWith("feature")
            }
        }
        steps {
            script {
                analysisStatus = 'OK'
                    if (randomResult == 14) {
                        analysisStatus = 'KO'
                            stageERROR = 'Nexus'
                    }
            }
            script {
                if (analysisStatus == 'KO') {
                    error 'error in Publish'
                }
            }
            echo 'Publish status: ' + randomResult
        }
    }
    stage('Build Docker Image') {
        when {
            expression {
                return !env.BRANCH_NAME.startsWith("feature")
            }
        }
        steps {
            script {
                analysisStatus = 'OK'
                    if (randomResult == 15) {
                        analysisStatus = 'KO'
                            stageERROR = 'DockerBuild'
                    }
            }
            script {
                if (analysisStatus == 'KO') {
                    error 'error in DockerBuild'
                }
            }
            echo 'DockerBuild status: ' + randomResult
        }
    }
    stage('Publish Docker Image') {
        when {
            expression {
                return !env.BRANCH_NAME.startsWith("feature")
            }
        }
        steps {
            script {
                analysisStatus = 'OK'
                    if (randomResult == 16) {
                        analysisStatus = 'KO'
                            stageERROR = 'DockerPublish'
                    }
            }
            script {
                if (analysisStatus == 'KO') {
                    error 'error in DockerPublish'
                }
            }
            echo 'DockerPublish status: ' + randomResult
        }
    }
    stage('Deploy') {
        when {
            expression {
                return !env.BRANCH_NAME.startsWith("feature")
            }
        }
        steps {
            script {
                analysisStatus = 'OK'
                    if (randomResult == 17) {
                        analysisStatus = 'KO'
                            stageERROR = 'Deploy'
                    }
            }
            script {
                if (analysisStatus == 'KO') {
                    error 'error in Deploy'
                }
            }
            echo 'Deploy status: ' + randomResult
        }
    }
    stage('ATDD') {
        when {
            expression {
                return !env.BRANCH_NAME.startsWith("feature")
            }
        }
        steps {
            script {
                analysisStatus = 'OK'
                    if (randomResult == 18) {
                        analysisStatus = 'KO'
                            stageERROR = 'ATDD'
                    }
            }
            script {
                if (analysisStatus == 'KO') {
                   error 'error in ATDD'
                }
            }
            echo 'Deploy status: ' + randomResult
        }
    }
}
post {
    always {
        echo 'I will always say Hello again!'
        script {
          def fields = env.getEnvironment()
          fields.each {
            key, value -> println("${key} = ${value}");
          }
          println(env.PATH)
        }
        sh label: 'helloworld', script: '''cat << \'EOF\' > json.json
        {
          "result": !env.RESULT,
          "stageError": '${stageERROR}',
          "buildCauses": '${currentBuild.getBuildCauses()}',
          "timeInMillis": '${currentBuild.timeInMillis}',
          "startTimeInMillis": '${currentBuild.startTimeInMillis}'
        }
        EOF'''
        sh label: 'helloworld', script: 'cat json.json'
    }
}
}
