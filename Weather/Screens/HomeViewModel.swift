//
//  HomeViewModel.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    enum ViewState {
        case idle
        case presenting(item: HomeViewData)
        case error(message: String)
        case empty(title: String, description: String)
    }
    
    @Published var viewState: ViewState = .idle
    @Published var searchText: String = ""
    @Published var canShowDescription: Bool = false
    @Published var isLoading: Bool = false
    
    let weatherRepository: WeatherRepository
        
    init(weatherRepository: WeatherRepository = WeatherRepository()) {
        self.weatherRepository = weatherRepository
        
    }
    
    func onSearchTapped() async {
        await fetch(with: searchText)
    }
    
    func onCardTapped() {
        canShowDescription = true
        AppStateService.shared.lastSearchedLocation = searchText
    }
    
    func onAppear() async {
        let lastSearchedLocation = AppStateService.shared.lastSearchedLocation

        if lastSearchedLocation.isEmpty {
            await MainActor.run {
                viewState = .empty(title: "No City Selected", description: "Please Search For A City")
            }
        } else {
            
            await fetch(with: lastSearchedLocation)
        }
    }
    
    @MainActor
    private func fetch(with text: String) async {
        canShowDescription = false
        isLoading = true
        defer { isLoading = false }

        guard !text.isEmpty else {
            await MainActor.run {
                viewState = .empty(title: "No City Selected", description: "Please Search For A City")
            }
            return
        }
        
        let result = await weatherRepository.fetch(with: text)
        
        switch result {
        case .success(let model):
            await MainActor.run {
                if let error = model.error {
                    viewState = .error(message: error.message ?? "Error Message")
                    return
                }
                
                guard let viewData = transform(from: model) else {
                    viewState = .error(message: "Sorry, Something Went Wrong!\nCouldn't transform view Data")
                    return
                }
                viewState = .presenting(item: viewData)
            }
            
        case .failure(let error):
            await MainActor.run {
                viewState = .error(message: error.localizedDescription)
            }
        }
    }
}

extension HomeViewModel: HomeTransformable {}
    
