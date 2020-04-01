docker build -t teemo2020/multi-client:latest -t teemo2020/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t teemo2020/multi-server:latest -t teemo2020/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t teemo2020/multi-worker:latest -t teemo2020/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push teemo2020/multi-client:latest
docker push teemo2020/multi-client:$SHA
docker push teemo2020/multi-server:latest
docker push teemo2020/multi-server:$SHA
docker push teemo2020/multi-worker:latest
docker push teemo2020/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployment/server-deployment server=teemo2020/multi-server:$SHA
kubectl set image deployment/client-deployment client=teemo2020/multi-client:$SHA
kubectl set image deployment/worker-deployment worker=teemo2020/multi-worker:$SHA


