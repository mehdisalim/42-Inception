up: build
	docker compose -f srcs/docker-compose.yml up -d

build :
	@mkdir -p ~/data/wordpress_data
	@mkdir -p ~/data/mariadb_data
	docker compose -f srcs/docker-compose.yml build

fclean : clean
	docker system prune -af

clean:
	docker compose -f srcs/docker-compose.yml down


clean_wordpress_data :
	rm -rf ~/data/wordpress_data/*
	
clean_mariadb_data :
	rm -rf ~/data/mariadb_data/*

re: fclean fclean up