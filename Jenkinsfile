pipeline {
    agent any

    environment {
        SONAR_SCANNER = tool name: 'SonarScanner'
        NEXUS_URL     = 'nexus-personal:8082'
        NEXUS_REPO    = 'docker-hosted'
    }

    stages {

        // ══════════════════════════════════════════
        //  BACKEND — NestJS
        // ══════════════════════════════════════════

        stage('Backend — Install') {
            steps {
                dir('rean-ot-backend') {
                    sh 'npm install'
                }
            }
        }

        stage('Backend — Lint') {
            steps {
                dir('rean-ot-backend') {
                    sh 'npm run lint'
                }
            }
        }

        stage('Backend — Test') {
            steps {
                dir('rean-ot-backend') {
                    sh 'npm run test:cov'
                }
            }
        }

        stage('Backend — Build') {
            steps {
                dir('rean-ot-backend') {
                    sh 'npm run build'
                }
            }
        }

        stage('Backend — SonarQube') {
            steps {
                dir('rean-ot-backend') {
                    withSonarQubeEnv('sonar') {
                        sh "${SONAR_SCANNER}/bin/sonar-scanner"
                    }
                }
            }
        }

        // ══════════════════════════════════════════
        //  FRONTEND — Vue 3
        // ══════════════════════════════════════════

        stage('Frontend — Install') {
            steps {
                dir('rean-ot-frontend') {
                    sh 'npm install'
                }
            }
        }

        stage('Frontend — Type Check') {
            steps {
                dir('rean-ot-frontend') {
                    sh 'npx vue-tsc --build'
                }
            }
        }

        stage('Frontend — Build') {
            steps {
                dir('rean-ot-frontend') {
                    sh 'npm run build-only'
                }
            }
        }

        stage('Frontend — SonarQube') {
            steps {
                dir('rean-ot-frontend') {
                    withSonarQubeEnv('sonar') {
                        sh "${SONAR_SCANNER}/bin/sonar-scanner"
                    }
                }
            }
        }

        // ══════════════════════════════════════════
        //  QUALITY GATE
        // ══════════════════════════════════════════

        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        // ══════════════════════════════════════════
        //  DEPLOY (local docker compose — cloud later)
        // ══════════════════════════════════════════

        // stage('Deploy to Cloud') {
        //     steps {
        //         echo 'Cloud deployment will be configured later'
        //         // When you have a cloud server, uncomment and add:
        //         // sshagent(['server-ssh-key']) {
        //         //     sh '''
        //         //         ssh user@your-server "
        //         //             cd /app/Rean-ot &&
        //         //             git pull origin main &&
        //         //             docker compose up -d --build
        //         //         "
        //         //     '''
        //         // }
        //     }
        // }
    }

    post {
        success {
            echo '✅ Rean-ot CI Pipeline — All stages passed!'
        }
        failure {
            echo '❌ Rean-ot CI Pipeline — Build failed!'
        }
        always {
            cleanWs()
        }
    }
}
