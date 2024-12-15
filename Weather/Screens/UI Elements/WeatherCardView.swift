//
//  WeatherCardView.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import SwiftUI

struct WeatherCardView: View {
    let viewData: HomeViewData
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 20) {
                Text(viewData.locationName)
                    .font(.system(size: 20, weight: .bold))
                
                Text(viewData.degreeDisplayed)
                    .font(.system(size: 60, weight: .bold))
                +
                Text("°")
                    .font(.system(size: 60))
            }
            
            Spacer()
            
            imageView(iconUrl: viewData.icon)
        }
        .foregroundColor(.nightRider)
        .padding(.vertical, 20)
        .padding(.horizontal, 30)
        .background(Color.whiteSmoke)
        .cornerRadius(16)
    }
    
    private func imageView(iconUrl: URL?) -> some View {
        AsyncImage(url: iconUrl,
                   scale: 1) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 83, height: 83)
        } placeholder: {
            ProgressView()
                .frame(width: 125, height: 125)
        }
    }
}

#Preview {
    WeatherCardView(viewData: .previewMock)
}
