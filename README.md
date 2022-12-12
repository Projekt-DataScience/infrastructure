# Infrastructure

Deployment Code

# Deploying only backend
**You need to be logged in via Docker CLI to Github.** [Tutorial](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-to-the-container-registry) 

1. Clone the repository

```
git clone https://github.com/Projekt-DataScience/infrastructure.git
```

After that you should have docker-compose-backend.yml and example.env locally on your machine.

![image](https://user-images.githubusercontent.com/39222224/206868733-637b404e-ba4a-4a38-b62b-3fe036bdbebf.png)

2. Copy the example.env file to `.env`

```
cp example.env .env
```

Now you should have a .env file

![image](https://user-images.githubusercontent.com/39222224/206868778-dcb52609-69c0-477c-b4f1-b841ff14362e.png)

3. **OPTIONAL:** Change environment variables. You can do that by changing the values in .env. **But do not change the DB_HOSTNAME environment variable!**

![image](https://user-images.githubusercontent.com/39222224/206868851-8203ca60-21f8-4b78-8964-255bf5434bbc.png)

4. Start the backend with the following command:

```
docker-compose -f docker-compose-backend.yml up
```

Or you can also use make:

```
make start-backend
```

Currently this command will start the following:

- Database Server on port 5432 (if you have not changed the `DB_PORT` environment variable)
- PgAdmin on port 8080
- Audit Service on port 8081

## Updating images

### Updating everything (including database structure)
**All the data inside the database will be lost**

The following commands should be run, if the database structure changed. That happens when new models/tables are added to backend-db-lib or existing models/tables are changed.

```
docker-compose -f docker-compose-backend.yml rm
docker volume rm infrastructure_manager_volume
docker-compose -f docker-compose-backend.yml pull
docker-compose -f docker-compose-backend.yml up
```

OR:

```
make reset-db
```

### Updating only images, without updating database structure
This won't delete any data in the database. Stop already running containers of this infrastructure and run the following commands:

```
docker-compose -f docker-compose-backend.yml pull
docker-compose -f docker-compose-backend.yml up
```

OR:

```
make update
```