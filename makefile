up:
	docker-compose -f docker/docker-compose.yml -p="my_wallet" up -d
down:
	docker-compose -f docker/docker-compose.yml -p="my_wallet" down
clean:
	docker-compose -f docker/docker-compose.yml stop && docker-compose -f docker/docker-compose.yml rm -f -v && docker system prune -f --volumes 
build:
	docker-compose -f docker/docker-compose.yml build
bash:
	docker-compose -f docker/docker-compose.yml exec app bash
restart: down up

