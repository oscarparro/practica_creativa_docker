docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q) -f
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q | grep -v "bridge\|host\|none")
docker system prune -a --volumes -f

docker exec -it kafka kafka-console-consumer.sh   --bootstrap-server kafka:9092   --topic flight_delay_classification_response   --from-beginning