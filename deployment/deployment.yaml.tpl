apiVersion: v1
kind: Namespace
metadata:
  name: web-app

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app-deployment
  labels:
    app: frontend
    env: devlopment
  namespace: web-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: frontend
      env: development
  template:
    containers:
      metadata:
        name: web-app
        labels:
          app: frontend
          env: development
        namespace: web-app
      spec:
        - name: web-app-container
          image: gcr.io/consolecicd-963258/webapp-color:SHORT_SHA
          containerPort: 8080