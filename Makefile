

start	:
	docker compose -f srcs/docker-compose.yml up -d

stop	:
	docker compose -f srcs/docker-compose.yml down

ils		:
	docker images ls -a

cls		:
	docker container ls -a