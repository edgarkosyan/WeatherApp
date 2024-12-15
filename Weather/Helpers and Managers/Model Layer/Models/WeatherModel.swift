//
//  WeatherModel.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import Foundation

struct WeatherModel: Codable {
    let location: LocationModel?
    let current: CurrentModel?
    let error: ErrorModel?
    
    enum CodingKeys: String, CodingKey {
        case location = "location"
        case current = "current"
        case error = "error"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.location = try values.decodeIfPresent(LocationModel.self, forKey: .location)
        self.current = try values.decodeIfPresent(CurrentModel.self, forKey: .current)
        self.error = try values.decodeIfPresent(ErrorModel.self, forKey: .error)
    }
}
