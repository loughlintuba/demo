// import groovy.json.*

// def contents = new JsonSlurper().parse('https://api.github.com/repos/loughlintuba/bq-ada/deployments/terraform/examples/basic_bq'.toURL())
//     .sort { it.type } // Directories first
//     .collect { it.name + (it.type == 'dir' ? '/' : '') } // Put a slash on the end of directories

// assert contents = ['handling/', 
//                    'internal/', 
//                    'render/', 
//                    'script/', 
//                    'server/', 
//                    'sql/', 
//                    'template/', 
//                    'Groovy.java', 
//                    'GroovyRatpackMain.java', 
//                    'package-info.java']


def k8slabel = "jenkins-pipeline-${UUID.randomUUID().toString()}"

def slavePodTemplate = """
      metadata:
        labels:
          k8s-label: ${k8slabel}
        annotations:
          jenkinsjoblabel: ${env.JOB_NAME}-${env.BUILD_NUMBER}
      spec:
        affinity:
          podAntiAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
            - labelSelector:
                matchExpressions:
                - key: component
                  operator: In
                  values:
                  - jenkins-jenkins-master
              topologyKey: "kubernetes.io/hostname"
        containers:
        - name: buildtools
          image: tuyalou/docker:c2316ef
          imagePullPolicy: IfNotPresent
          command:
          - cat
          tty: true
          volumeMounts:
            - mountPath: /var/run/docker.sock
              name: docker-sock
        - name: docker
          image: docker:latest
          imagePullPolicy: IfNotPresent
          command:
          - cat
          tty: true
          volumeMounts:
            - mountPath: /var/run/docker.sock
              name: docker-sock
        serviceAccountName: default
        securityContext:
          runAsUser: 0
          fsGroup: 0
        volumes:
          - name: docker-sock
            hostPath:
              path: /var/run/docker.sock
    """

    properties([
        parameters([
            booleanParam(defaultValue: false, description: 'Please select to apply the changes ', name: 'terraformApply'),
            booleanParam(defaultValue: false, description: 'Please select to destroy all ', name: 'terraformDestroy'),
            choice(choices: ['dev', 'qa', 'prod'], description: 'Please select the environment to deploy.', name: 'environment'),
            choice(choices: ['bq', 'bucket', 'instance', 'pubsub', 'kms', 'service-account', 'sql-db'], name: 'resource'),
            choice(choices: ['data-general', 'data-federated-financial', 'compute-engegament', 'compute-general', 'sandbox'], name: 'account')
        ])
    ])
    
    podTemplate(name: k8slabel, label: k8slabel, yaml: slavePodTemplate, showRawYaml: false) {
      node(k8slabel) {
        stage("Pull SCM") {
            git 'https://github.com/loughlintuba/bq-ada.git'
        }
        container("buildtools") {
            dir("${resource}") {
                withCredentials([file(credentialsId: 'tiffany', variable: 'service_account')]) {
                    stage("Terraform Apply/plan") {
                        if (!params.terraformDestroy) {
                            if (params.terraformApply) {
                                println("Applying the changes")
                                sh '''#!/bin/bash -e
                                DIR=$(pwd)
                                cp -rf ${service_account}  $DIR/credentials.json
                                source ./set-env.sh 
                                terraform init
                                terraform apply -auto-approve -var-file ./${account}/${account}-${resource}-${environment}.tfvars
                                '''
                            } else {
                                println("Planing the changes")
                                sh '''#!/bin/bash -e
                                DIR=$(pwd)
                                cp -rf ${service_account}  $DIR/credentials.json
                                source ./set-env.sh 
                                terraform init
                                terraform plan -var-file -var-file ./${account}/${account}-${resource}-${environment}.tfvars
                                '''
                            }
                        }
                    }

                    stage("Terraform Destroy") {
                        if (params.terraformDestroy) {
                            println("Destroying the all")
                                sh '''#!/bin/bash -e
                                DIR=$(pwd)
                                cp -rf ${service_account}  $DIR/credentials.json
                                source ./set-env.sh 
                                terraform version
                                terraform init
                                terraform destroy -auto-approve -var-file ./${account}/${account}-${resource}-${environment}.tfvars
                                '''
                        } else {
                            println("Skiping the destroy")
                        }
                    }
                }

            }
        }
      }
    }
