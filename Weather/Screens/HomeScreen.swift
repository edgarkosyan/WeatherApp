//
//  HomeScreen.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: HomeViewModel())
    }
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                TextField("Search Location", text: $viewModel.searchText)
                Button(action: {
                    Task {
                        await viewModel.onSearchTapped()
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(5)
                })
                
            }
            .font(.system(size: 15))
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.whiteSmoke)
            .cornerRadius(12)
            .padding(.horizontal,30)
            .padding(.top, 40)
            
            VStack {
                switch viewModel.viewState {
                case .idle:
                    EmptyView()
                case let .presenting(viewData):
                    presentingView(viewData: viewData)
                case let .error(message):
                    errorView(message: message)
                case let .empty(title, description):
                    emptyView(title: title, description: description)
                }
            }
            .tdFullScreen()
        }
        .tdFullScreen()
        .animation(.default, value: viewModel.canShowDescription)
        .overlay(content: {
            if viewModel.isLoading {
                LoadingView()
            }
        })
        .onAppear() {
            Task {
                await viewModel.onAppear()
            }
        }
    }
    
    private func presentingView(viewData: HomeViewData) -> some View {
        VStack(spacing: 20) {
            if viewModel.canShowDescription {
                WeatherDescriptionView(viewData: viewData)
            } else {
                WeatherCardView(viewData: viewData)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .onTapGesture {
                        viewModel.onCardTapped()
                    }
            }
        }
        .tdFullScreen(alignment: .top)
    }
 
    private func errorView(message: String) -> some View {
        Text(message)
            .font(.system(size: 30, weight: .bold))
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
            .tdFullScreen()
        
    }
    
    private func emptyView(title: String, description: String) -> some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.system(size: 30, weight: .bold))
                .multilineTextAlignment(.center)
        
            Text(description)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 20)
        .tdFullScreen()
    }
}

#Preview {
    HomeScreen()
}


struct TDFullScreen: ViewModifier {
    let alignment: Alignment

    func body(content: Content) -> some View {
        content
            .frame(minWidth: .zero,
                   maxWidth: .infinity,
                   minHeight: .zero,
                   maxHeight: .infinity,
                   alignment: alignment)
    }
}

extension View {
    func tdFullScreen(alignment: Alignment = .center) -> some View {
        modifier(TDFullScreen(alignment: alignment))
    }
}

// MARK: - Full Width View

struct TDFullWidth: ViewModifier {
    let alignment: Alignment

    func body(content: Content) -> some View {
        content
            .frame(minWidth: .zero,
                   maxWidth: .infinity,
                   alignment: alignment)
    }
}

extension View {
    func tdFullWidth(alignment: Alignment = .center) -> some View {
        modifier(TDFullWidth(alignment: alignment))
    }
}
