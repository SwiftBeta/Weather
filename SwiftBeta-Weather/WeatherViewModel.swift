//
//  WeatherViewModel.swift
//  SwiftBeta-Weather
//
//  Created by Home on 22/10/21.
//

import Foundation

// http://api.openweathermap.org/data/2.5/weather?q=barcelona&appid=71c3e78149e90edcb26b5c8bf57708fa&units=metric&lang=es

final class WeatherViewModel: ObservableObject {
    @Published var weatherModel: WeatherModel = .empty
    private let weatherModelMapper: WeatherModelMapper = WeatherModelMapper()
    
    func getWeather(city: String) async {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=71c3e78149e90edcb26b5c8bf57708fa&units=metric&lang=es")!

        do {
            async let (data, _) = try await URLSession.shared.data(from: url)
            let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            
            DispatchQueue.main.async {
                self.weatherModel = self.weatherModelMapper.mapDataModelToModel(dataModel: dataModel)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
