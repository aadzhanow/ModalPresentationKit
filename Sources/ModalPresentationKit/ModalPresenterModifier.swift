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
        content
            .fullScreenCover(item: $presenter.fullScreenCoverDestination, onDismiss: {
                presenter.dismiss()
            }) { destination in
                destination
                    .environmentObject(presenter)
            }
            .sheet(item: $presenter.sheetDestination, onDismiss: {
                presenter.dismiss()
            }) { destination in
                destination
                    .environmentObject(presenter)
            }
    }
}

public extension View {
    func modalPresenter<Destination: DestinationProtocol>(_ presenter: ModalPresenter<Destination>) -> some View {
        self.modifier(ModalPresenterModifier(presenter: presenter))
    }
}
