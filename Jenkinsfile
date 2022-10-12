
node ('master') {

  stage ('git-scm') {
    checkout changelog: false, 
        poll: false, 
        scm: [$class: 'GitSCM', 
        branches: [[name: '*/master']], 
        extensions: [], 
        userRemoteConfigs: [[url: 'https://github.com/ganeshhp/Maven-petclinic-project.git']]]
  }
  
  stage ('maven') {
    sh 'mvn clean package'
  }
  
  stage ('artifact-repo'){   
    sh 'curl -uuser1:APEkqK6UcRQmCrj4AeR2DMkoMe -T target/petclinic.war "https://autofact.jfrog.io/artifactory/petclinic/petclinic.war"'
  }

  input 'Proceed with Deployment to Remote repo?'
  
  stage ('publish HTML reports') {
    publishHTML([allowMissing: false, 
         alwaysLinkToLastBuild: false, keepAll: false, 
         reportDir: 'target/site/jacoco', 
         reportFiles: 'index.html', reportName: 'HTML Report', 
         reportTitles: 'test_report'])
  }
  stage ('archive-artifacts') {
    archiveArtifacts artifacts: 'target/petclinic.war', followSymlinks: false
  }
}
