# IONO API 

This API provides restaurant information based on a user's location (IP Address).

## Install

`bundle install`<br>
`rails db:{create, migrate}`

## Database

<img src="/documentation/images/schema.png">

## REST API

The REST API to the IONO app is described below.

### Get Restaurants
Returns 40 restaurants.
#### Request 

GET '/api/v1/restaurants'

    curl -i -H 'Accept: application/json' http://localhost:5000/api/v1/restaurants
#### Response Body

```
{
    "businesses": [
        {
            "id": "dnJvyhSPiIVlmpdM_3SCrg",
            "alias": "snooze-an-a-m-eatery-denver-12",
            "name": "Snooze, an A.M. Eatery",
            "image_url": "https://s3-media4.fl.yelpcdn.com/bphoto/cniSi66T4iS6nqCdML6HUQ/o.jpg",
            "is_closed": false,
            "url": "https://www.yelp.com/biz/snooze-an-a-m-eatery-denver-12?adjust_creative=HXaFGsDa_NpgBlPglTMuTA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=HXaFGsDa_NpgBlPglTMuTA",
            "review_count": 4795,
            "categories": [
                {
                    "alias": "breakfast_brunch",
                    "title": "Breakfast & Brunch"
                },
                {
                    "alias": "cocktailbars",
                    "title": "Cocktail Bars"
                },
                {
                    "alias": "tradamerican",
                    "title": "American (Traditional)"
                }
            ],
            "rating": 4.5,
            "coordinates": {
                "latitude": 39.75544,
                "longitude": -104.98883
            },
            "transactions": [
                "delivery"
            ],
            "price": "$$",
            "location": {
                "address1": "2262 Larimer St",
                "address2": "",
                "address3": "",
                "city": "Denver",
                "zip_code": "80205",
                "country": "US",
                "state": "CO",
                "display_address": [
                    "2262 Larimer St",
                    "Denver, CO 80205"
                ]
            },
            "phone": "+13032970700",
            "display_phone": "(303) 297-0700",
            "distance": 1839.4484424332475
        } ]
```