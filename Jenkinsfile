def randomResult = new java.util.Random().nextInt(35)
def analysisStatus = 'OK'
def stageERROR = ''
def s3BucketName = 'jenkins-agile'
def jsonName = ${JOB_BASE_NAME}${BUILD_ID}'.json'

pipeline {
agent any
stages {
    stage('Build') {
        steps {
            echo "branch name: $BRANCH_NAME"
            echo jsonName
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
        sh label: 'print env variables', script: 'env'
        script {
          sh label: 'Creating JSON File', script: '''cat << \'EOF\' > ${env.jsonName}
          {
            "buildNumber": !env.BUILD_NUMBER,
            "result": ${RESULT},
            "stageError": '${stageERROR}',
            "buildCauses": '${currentBuild.getBuildCauses()}',
            "timeInMillis": '${currentBuild.timeInMillis}',
            "startTimeInMillis": '${currentBuild.startTimeInMillis}'
          }
          EOF'''
        }
        sh label: 'print generated json file', script: 'cat ${env.jsonName}'
        sh label: 'copy generated json file to s3', script: 'aws s3 cp ${env.jsonName} s3://${env.s3BucketName}'
    }
}
}
