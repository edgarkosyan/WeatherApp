//
//  HomeViewData.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import Foundation

struct HomeViewData {
    let icon: URL?
    let locationName: String
    let degree: Double
    let humidity: Int
    let uv: Double
    let feelsLike: Double
    
    var degreeDisplayed: String {
        "\(String(format: "%.0f", degree))"
    }
    
    var humidityDisplayed: String {
        "\(humidity) %"
    }
    
    var uvDisplayed: String {
        String(format: "%.0f", uv)
    }
    
    var feelsLikeDisplayed: String {
        "\(String(format: "%.0f", feelsLike)) °"
    }
    
}

extension HomeViewData {
    static var previewMock: Self  = .init(icon: nil, locationName: "San Diego", degree: 24, humidity: 49, uv: 1, feelsLike: 25)
}

protocol HomeTransformable {
    func transform(from model: WeatherModel?) -> HomeViewData?
}

extension HomeTransformable {
    func transform(from model: WeatherModel?) -> HomeViewData? {
        guard let model = model,
              let locationName = model.location?.name,
              let degree = model.current?.tempC,
              let humidity = model.current?.humidity,
              let uv = model.current?.uv,
              let feelsLike = model.current?.feelsLikeC else { return nil }
        
        let iconString = "https:" + (model.current?.condition?.icon ?? "")
        return HomeViewData(icon: URL(string: String(iconString)),
                            locationName: locationName,
                            degree: degree,
                            humidity:  humidity,
                            uv: uv,
                            feelsLike: feelsLike)
    }
}
