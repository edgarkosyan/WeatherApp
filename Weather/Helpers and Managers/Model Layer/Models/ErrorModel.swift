//
//  ErrorModel.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import Foundation

struct ErrorModel: Codable {
    let code: Int?
    let message: String?
}
