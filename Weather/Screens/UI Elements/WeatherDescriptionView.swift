//
//  WeatherDescriptionView.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import SwiftUI

struct WeatherDescriptionView: View {
    let viewData: HomeViewData
    var body: some View {
        VStack(spacing: 20) {
            // Image View
        imageView(iconUrl: viewData.icon)
            
            // Location Name
            Text(viewData.locationName)
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.nightRider)
                .padding(.horizontal, 20)
                .overlay(alignment: .topTrailing) {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 15))
                        .padding(.top, 5)
                }
            
            // Degree
            Text(viewData.degreeDisplayed)
                .font(.system(size: 70, weight: .bold))
                .foregroundColor(.nightRider)
            +
            Text("°")
                .font(.system(size: 70))
            
            
            HStack {
                weatherParameterView(title: "Humidity", value: viewData.humidityDisplayed)
                Spacer()
                weatherParameterView(title: "UV", value: viewData.uvDisplayed)
                Spacer()
                weatherParameterView(title: "Feels Like", value: viewData.feelsLikeDisplayed)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
            .background(Color.whiteSmoke)
            .cornerRadius(16)
            .padding(.horizontal, 40)
        }
    }
    
    private func weatherParameterView(title: String, value: String) -> some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(.silver)
            Text(value)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.nobel)
        }
    }
    
    private func imageView(iconUrl: URL?) -> some View {
        AsyncImage(url: iconUrl,
                   scale: 1) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 125, height: 125)
        } placeholder: {
            ProgressView()
                .frame(width: 125, height: 125)
        }
    }
}

#Preview {
    WeatherDescriptionView(viewData: .previewMock)
}
