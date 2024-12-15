//
//  LocationModel.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import Foundation

struct LocationModel: Codable {
    let name: String?
    let region: String?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case region = "region"
        case country = "country"
    }
}
