start-backend:
	docker-compose -f docker-compose-backend.yml up

update:
	docker-compose -f docker-compose-backend.yml pull
	docker-compose -f docker-compose-backend.yml up

reset-db:
	docker-compose -f docker-compose-backend.yml rm
	docker volume rm infrastructure_manager_volume
	docker-compose -f docker-compose-backend.yml pull
	docker-compose -f docker-compose-backend.yml up