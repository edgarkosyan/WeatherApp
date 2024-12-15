//
//  LoadingView.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .frame(width: 100, height: 100)
            .background(Color.whiteSmoke)
            .cornerRadius(16)
    }
}

#Preview {
    LoadingView()
}
