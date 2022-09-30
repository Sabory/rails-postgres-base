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

# Next **steps**
- aggregar ubicaciones como enum x mientras
- mapear ubicaciones con property_listing
- WIP scrap_portal_inmobiliario como commando

## Examples
- [Portal Inmobiliario search example](https://www.portalinmobiliario.com/venta/departamento/providencia-metropolitana/_PriceRange_100CLF-6500CLF_BEDROOMS_2-5_FULL*BATHROOMS_2-5_NoIndex_True_PARKING*LOTS_1-5_TOTAL*AREA_30-300#applied_filter_id%3DPARKING_LOTS%26applied_filter_name%3DEstacionamientos%26applied_filter_order%3D11%26applied_value_id%3D1-5%26applied_value_name%3D1-5%26applied_value_order%3D5%26applied_value_results%3DUNKNOWN_RESULTS%26is_custom%3Dtrue)