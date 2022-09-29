# README

Things you may want to cover:

## Ruby version: 
3.1.2

## Configuration

### Development
#### Database
Start database using compose `docker-compose.yml` file
```
docker-compose up
```
This will create a database with the credentials found in `.env.development` file

#### Rails
```sh
rails db:migrate
rails s
```

### Production
just run docker compose:
```sh
docker compose up -f docker-compose.prod.yml
```