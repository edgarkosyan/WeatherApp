//
//  AppStateService.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import Foundation

final class AppStateService {
    static let shared = AppStateService()
    
    enum Constants {
        static var lastSearchedLocationKey = "LASTSEARCHEDLOCKATIONKEY"
    }
    var lastSearchedLocation: String {
        didSet {
            UserDefaults.standard.set(lastSearchedLocation, forKey: Constants.lastSearchedLocationKey)
        }
    }
    
    init() {
        self.lastSearchedLocation = UserDefaults.standard.string(forKey: Constants.lastSearchedLocationKey) ?? ""
    }
}
