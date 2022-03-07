//
//  WeatherModelMapper.swift
//  SwiftBeta-Weather
//
//  Created by Home on 22/10/21.
//

import Foundation

struct WeatherModelMapper {
    func mapDataModelToModel(dataModel: WeatherResponseDataModel) -> WeatherModel {
        guard let weather = dataModel.weather.first else {
            return .empty
        }
        
        let temperature = dataModel.temperature
        
        let sunsetWithTimezone = dataModel.sun.sunset.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))
        let sunriseWithTimezone = dataModel.sun.sunrise.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))
        
        return WeatherModel(city: dataModel.city,
                            weather: weather.main,
                            description: "(\(weather.description))",
                            iconURL: URL(string: "http://openweathermap.org/img/wn/\(weather.iconURLString)@2x.png"),
                            currentTemperature: "\(Int(temperature.currentTemperature))º",
                            minTemperature: "\(Int(temperature.minTemperature))º Min.",
                            maxTemprature: "\(Int(temperature.maxTemperature))º Máx.",
                            humidity: "\(temperature.humidity)%",
                            sunset: sunsetWithTimezone,
                            sunrise: sunriseWithTimezone)
    }
}
