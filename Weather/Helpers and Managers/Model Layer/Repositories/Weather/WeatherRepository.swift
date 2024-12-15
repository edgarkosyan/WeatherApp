//
//  WeatherRepository.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import Foundation

protocol WeatherRepositoring {
    func fetch(with location: String) async -> Result<WeatherModel, ModelLayersError>
}

class WeatherRepository: WeatherRepositoring {
    
    private let baseURL = "https://api.weatherapi.com/v1/current.json"
    private let apiKey = "56359cfcfb8c4a4f98391738241512"
    
    func fetch(with location: String) async -> Result<WeatherModel, ModelLayersError> {
        guard let url = buildURL(for: location) else {
            return .failure(.invalidURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(WeatherModel.self, from: data)
            return .success(response)
        } catch {
            print("Error: \(error.localizedDescription)")
            return .failure(.failedWith(error: error))
        }
    }
    
    private func buildURL(for value: String) -> URL? {
        var components = URLComponents(string: baseURL)
        components?.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: value)
        ]
        return components?.url
    }
}
