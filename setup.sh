#start minikube
minikube delete
minikube start --vm-driver=docker


#Remplacer l'IP du cluster dans les fichiers de config
CLUSTER_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

sed -i 's/172.17.0.3/'$CLUSTER_IP'/g' srcs/yaml_files/metallb-config.yaml
sed -i 's/172.17.0.3/'$CLUSTER_IP'/g' srcs/nginx/nginx.conf
sed -i 's/172.17.0.3/'$CLUSTER_IP'/g' srcs/ftps/vsftpd.conf
sed -i 's/172.17.0.3/'$CLUSTER_IP'/g' srcs/wordpress/wp.sh
sed -i 's/172.17.0.3/'$CLUSTER_IP'/g' srcs/telegraf/telegraf.conf


#link with docker

eval $(minikube docker-env)

#build and deploy services

build_service()
{
	docker build -t services/$1 srcs/$1
	kubectl apply -f srcs/$1/$1.yaml
}

services="phpmyadmin mysql nginx wordpress ftps influxdb telegraf grafana"

#install metallb

kubectl apply -f srcs/metallb/metallb-namespace.yaml
kubectl apply -f srcs/metallb/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/metallb-config.yaml

for deploy in $services
do
	build_service $deploy
done

minikube dashboard
