#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create monitoring namespace"){
            steps{
                script{
                    try{
                        sh "kubectl create namespace monitoring"
                    }
                    catch(error){

                    }
                }
            }
        }
        stage("Deploy to Sock App") {
            steps {
                script {
                    dir('socks-app/deployment/kubernetes') {
                        try{
                            sh "aws eks update-kubeconfig --name altschool-exam-cluster"
                            sh "kubectl create -f main.yaml"
                        }
                        catch(error){
                            sh "kubectl apply -f main.yaml"
                        }

                    }
                }
            }
        }
        stage("Apply the clusterRole config"){
            steps{
                script {
                    dir('monitoring') {
                        try{
                            sh "kubectl create -f clusterRole.yaml"
                        }
                        catch(error){
                            sh "kubectl apply -f clusterRole.yaml"
                        }

                    }
                }
            }
        }
        stage("Deploy prometheus configuration"){
            steps{
                script {
                    dir('monitoring') {
                        try{
                            sh "kubectl create -f config-map.yaml"
                        }
                        catch(error){
                            sh "kubectl apply -f config-map.yaml"
                        }

                    }
                }
            }
        }
        stage("Deploy prometheus to kubernetes"){
            steps{
                script {
                    dir('monitoring') {
                        try{
                            sh "kubectl create -f prometheus-deployment.yaml"
                        }
                        catch(error){
                            sh "kubectl apply -f prometheus-deployment.yaml"
                        }

                    }
                }
            }
        }
        stage("Deploy prometheus service to kubernetes"){
            steps{
                script {
                    dir('monitoring') {            
                            sh "kubectl create -f prometheus-service.yaml"

                    }
                }
            }
        }
        stage("Setting up Kube State Metrics on Kubernetes"){
            steps{
                script {
                    dir('monitoring') {
                        try{
                            sh "git clone https://github.com/devopscube/kube-state-metrics-configs.git"
                            sh "kubectl apply -f kube-state-metrics-configs/"
                        }
                        catch(error){
                            sh "kubectl apply -f kube-state-metrics-configs/"
                        }
                    }
                }
            }
        }
        stage("Deploy Node Exporter  Deamonset"){
            steps{
                script {
                    dir('monitoring') {
                        try{
                            sh "kubectl create -f daemonset.yaml"
                        }
                        catch(error){
                            sh "kubectl apply -f daemonset.yaml"
                        }

                    }
                }
            }
        }
        stage("Deploy Node Exporter Service"){
            steps{
                script {
                    dir('monitoring') {
                        try{
                            sh "kubectl create -f node-exporter-service.yaml"
                        }
                        catch(error){
                            sh "kubectl apply -f node-exporter-service.yaml"
                        }

                    }
                }
            }
        }
        stage("Create configmap for grafana"){
            steps{
                script {
                    dir('monitoring') {
                        try{
                            sh "kubectl create -f grafana-datasource-config.yaml"
                        }
                        catch(error){
                            sh "kubectl apply -f grafana-datasource-config.yaml"
                        }

                    }
                }
            }
        }
        stage("Deploy grafana"){
            steps{
                script {
                    dir('monitoring') {
                        try{
                            sh "kubectl create -f grafana-deployment.yaml"
                        }
                        catch(error){
                            sh "kubectl apply -f grafana-deployment.yaml"
                        }

                    }
                }
            }
        }
        stage("Deploy grafana service "){
            steps{
                script {
                    dir('monitoring') {
                        try{
                            sh "kubectl create -f grafana-service.yaml"
                        }
                        catch(error){
                            sh "kubectl apply -f grafana-service.yaml"
                        }

                    }
                }
            }
        }
    }
}
