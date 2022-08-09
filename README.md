# Whether Sweater

This application creates an API for a Front End team to utilize to provide a user with information about
weather forecasts at a given location. It also has an enpoint to create a road trip and get the weather at the
time of arrival. Two external APIs are used to get location and weather data. The data retrieved from the 
external APIs is then formatted and any extra unnecessary data is not passed on in the endpoints created in this app.

## Local Installation 
To install this on your local machine, clone this repository and run the following commands.

`bundle install`

`bundle exec figaro install`

`rails db:{create,migrate}`

Get API keys from the following websites
- https://developer.mapquest.com/documentation/geocoding-api/
- https://openweathermap.org/api/one-call-api

Enter the api keys in your config/application.yml file in the following format.

weather_api_key: <your_api_key>

map_api_key: <your_api_key>

Note about tests: The first time running the tests, the server must be running so that vcr can create cassettes for the local API enpoint tests.

## API Endpoints
### Retrieve weather and forecast for a specified location
```
GET /api/v1/forecast?location=denver,co
```
Response: 
```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2022-08-08 13:44:36 -0600",
        "sunrise": "2022-08-08 06:05:32 -0600",
        "sunset": "2022-08-08 20:05:40 -0600",
        "temperature": 84.99,
        "feels_like": 84.15,
        "humidity": 39,
        "uvi": 9.47,
        "visibility": 10000,
        "conditions": "clear sky",
        "icon": "01d"
      },
      "daily_weather": [
         {
          "date": "2022-08-08",
          "sunrise": "2022-08-08 06:05:32 -0600",
          "sunset": "2022-08-08 20:05:40 -0600",
          "max_temp": 86.54,
          "min_temp": 66.38,
          "conditions": "clear sky",
          "icon": "01d"
          },
          {
          "date": "2022-08-09",
          "sunrise": "2022-08-09 06:06:29 -0600",
          "sunset": "2022-08-09 20:04:28 -0600",
          "max_temp": 92.66,
          "min_temp": 71.6,
          "conditions": "clear sky",
          "icon": "01d"
          },
          {
          "date": "2022-08-10",
          "sunrise": "2022-08-10 06:07:26 -0600",
          "sunset": "2022-08-10 20:03:15 -0600",
          "max_temp": 94.84,
          "min_temp": 72.45,
          "conditions": "clear sky",
          "icon": "01d"
          },
          {
          "date": "2022-08-11",
          "sunrise": "2022-08-11 06:08:23 -0600",
          "sunset": "2022-08-11 20:02:01 -0600",
          "max_temp": 96.75,
          "min_temp": 73.17,
          "conditions": "clear sky",
          "icon": "01d"
          },
          {
          "date": "2022-08-12",
          "sunrise": "2022-08-12 06:09:20 -0600",
          "sunset": "2022-08-12 20:00:45 -0600",
          "max_temp": 95.54,
          "min_temp": 74.44,
          "conditions": "overcast clouds",
          "icon": "04d"
          }
       ],
      "hourly_weather": [
         {
         "time": "13:00:00",
          "temperature": 84.87,
          "conditions": "clear sky",
          "icon": "01d"
          },
          {
          "time": "14:00:00",
          "temperature": 84.99,
          "conditions": "clear sky",
          "icon": "01d"
          },
          {
          "time": "15:00:00",
          "temperature": 85.66,
          "conditions": "clear sky",
          "icon": "01d"
          },
          {
          "time": "16:00:00",
          "temperature": 86.43,
          "conditions": "few clouds",
          "icon": "02d"
          },
          {
          "time": "17:00:00",
          "temperature": 86.31,
          "conditions": "few clouds",
          "icon": "02d"
          },
          {
          "time": "18:00:00",
          "temperature": 86.54,
          "conditions": "few clouds",
          "icon": "02d"
          },
          {
          "time": "19:00:00",
          "temperature": 85.19,
          "conditions": "clear sky",
          "icon": "01d"
          },
          {
          "time": "20:00:00",
          "temperature": 82.65,
          "conditions": "clear sky",
          "icon": "01d"
          }
      ]
    }
  }
}
              
```

### User Registration
```
POST '/api/v1/users'
body:
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
Response:
```
{
 "data": {
   "type":"users",
   "id":163,
   "attributes": {
     "email":"whatever@example.com",
     "api_key":"jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### User login
```
POST /api/v1/sessions
body:
{
  "email": "whatever@example.com",
  "password": "password"
}
```
Response:
```
{
 "data": {
   "type":"users",
   "id":164,
   "attributes": {
     "email":"whatever@example.com",
     "api_key":"jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### Road Trip
```
POST /api/v1/road_trip
body:
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
Response:
```
{
  "data": {
    "id":null,
    "type":"roadtrip",
    "attributes": {
      "start_city":"Denver,CO",
      "end_city":"Pueblo,CO",
      "travel_time":"1 hours, 45 minutes",
      "weather_at_eta": {
        "temperature":74.5,
        "conditions":"clear sky"
      }
    }
  }
}
```
