//
//  ModalPresenterModifier.swift
//  ModalPresentationKit
//
//  Created by Alisher on 09.10.2024.
//

import SwiftUI

public struct ModalPresenterModifier<Destination: DestinationProtocol>: ViewModifier {
    @ObservedObject var presenter: ModalPresenter<Destination>

    public func body(content: Content) -> some View {
        #if os(iOS) || os(tvOS)
        content
            .sheet(item: $presenter.sheetDestination, onDismiss: {
                presenter.dismiss(style: .sheet)
            }) { destination in
                destination
                    .environmentObject(presenter)
            }
            .fullScreenCover(item: $presenter.fullScreenCoverDestination, onDismiss: {
                presenter.dismiss(style: .fullScreenCover)
            }) { destination in
                destination
                    .environmentObject(presenter)
            }
        #else
        content
            .sheet(item: $presenter.sheetDestination, onDismiss: {
                presenter.dismiss(style: .sheet)
            }) { destination in
                destination
                    .environmentObject(presenter)
            }
        #endif
    }
}

public extension View {
    func modalPresenter<Destination: DestinationProtocol>(_ presenter: ModalPresenter<Destination>) -> some View {
        self.modifier(ModalPresenterModifier(presenter: presenter))
    }
}


