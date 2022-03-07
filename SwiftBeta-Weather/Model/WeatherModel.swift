//
//  WeatherModel.swift
//  SwiftBeta-Weather
//
//  Created by Home on 22/10/21.
//

import Foundation

struct WeatherModel {
    let city: String
    let weather: String
    let description: String
    let iconURL: URL?
    let currentTemperature: String
    let minTemperature: String
    let maxTemprature: String
    let humidity: String
    let sunset: Date
    let sunrise: Date
    
    static let empty: WeatherModel = .init(city: "No city",
                                           weather: "No weather",
                                           description: "No description",
                                           iconURL: nil,
                                           currentTemperature: "0º",
                                           minTemperature: "0º Min.",
                                           maxTemprature: "0º Máx.",
                                           humidity: "0%",
                                           sunset: .now,
                                           sunrise: .now)
}
