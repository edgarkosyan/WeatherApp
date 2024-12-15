//
//  Extensions+View.swift
//  Weather
//
//  Created by edgar kosyan on 15.12.24.
//

import Foundation
import SwiftUI

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
