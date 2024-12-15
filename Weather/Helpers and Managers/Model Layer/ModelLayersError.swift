//
//  ModelLayersError.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import Foundation

public enum ModelLayersError: Error {
    case invalidURL
    case nextPageNotAvailable
    case decodableError
    case dataNil
    case taskCancelled
    case failedWith(message: String)
    case failedWith(error: Error)
}
