all:
	docker compose --project-directory ./srcs/ up --build -d
rm:
	docker compose --project-directory ./srcs/ down
	docker images -qa | xargs docker rmi -f
vl:
	docker volume ls
nt:
	docker network ls
vrm:
	sudo rm -rf /home/zbentale/data/wordpress/*
	sudo rm -rf /home/zbentale/data/mariadb/*