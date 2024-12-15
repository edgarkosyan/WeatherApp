//
//  CurrentModel.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import Foundation

struct CurrentModel: Codable {
    let tempC: Double?
    let condition: ConditionModel?
    let humidity: Int?
    let feelsLikeC: Double?
    let uv: Double?

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition = "condition"
        case humidity = "humidity"
        case feelsLikeC = "feelslike_c"
        case uv = "uv"
    }
}
