apiVersion: v1
kind: Namespace
metadata:
  name: webapp-color

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app-deployment
  labels:
    app: frontend
    env: devlopment
  namespace: webapp-color
spec:
  replicas: 4
  selector:
    matchLabels:
      app: frontend
      env: development
  template:
      metadata:
        name: web-app
        labels:
          app: frontend
          env: development
        namespace: webapp-color
      spec:
        containers:
          - name: web-app-container
            image: gcr.io/consolecicd-963258/webapp-color:SHORT_SHA
            ports:
              - containerPort: 8080