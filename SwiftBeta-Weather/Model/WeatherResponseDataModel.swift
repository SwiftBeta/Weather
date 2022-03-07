//
//  WeatherResponseDataModel.swift
//  SwiftBeta-Weather
//
//  Created by Home on 22/10/21.
//

import Foundation

struct WeatherResponseDataModel: Decodable {
    let city: String
    let weather: [WeatherDataModel]
    let temperature: TemeperatureDataModel
    let sun: SunModel
    let timezone: Double
    
    enum CodingKeys: String, CodingKey {
        case city = "name"
        case weather
        case temperature = "main"
        case sun = "sys"
        case timezone
    }
}

struct SunModel: Decodable {
    let sunrise: Date
    let sunset: Date
}

struct WeatherDataModel: Decodable {
    let main: String
    let description: String
    let iconURLString: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case description
        case iconURLString = "icon"
    }
}

struct TemeperatureDataModel: Decodable {
    let currentTemperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case currentTemperature = "temp"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case humidity
    }
}

/*
 {
   "coord": {
     "lon": 2.159,
     "lat": 41.3888
   },
   "weather": [
     {
       "id": 801,
       "main": "Clouds",
       "description": "algo de nubes",
       "icon": "02d"
     }
   ],
   "base": "stations",
   "main": {
     "temp": 20.61,
     "feels_like": 20.48,
     "temp_min": 19.15,
     "temp_max": 22.89,
     "pressure": 1018,
     "humidity": 67
   },
   "visibility": 10000,
   "wind": {
     "speed": 0.89,
     "deg": 170,
     "gust": 4.02
   },
   "clouds": {
     "all": 20
   },
   "dt": 1634910818,
   "sys": {
     "type": 2,
     "id": 18549,
     "country": "ES",
     "sunrise": 1634883059,
     "sunset": 1634922021
   },
   "timezone": 7200,
   "id": 3128760,
   "name": "Barcelona",
   "cod": 200
 }
 */
