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
                presenter.didCompleteDismissal(of: .sheet)
            }) { destination in
                destination
                    .environmentObject(presenter)
                    .transaction { transaction in
                        // Use default animation for sheet presentations
                        transaction.animation = .default
                    }
            }
            .fullScreenCover(item: $presenter.fullScreenCoverDestination, onDismiss: {
                presenter.didCompleteDismissal(of: .fullScreenCover)
            }) { destination in
                destination
                    .environmentObject(presenter)
                    .transaction { transaction in
                        // Use default animation for fullScreenCover presentations
                        transaction.animation = .default
                    }
            }
        #else
        content
            .sheet(item: $presenter.sheetDestination, onDismiss: {
                presenter.didCompleteDismissal(of: .sheet)
            }) { destination in
                destination
                    .environmentObject(presenter)
                    .transaction { transaction in
                        // Use default animation for sheet presentations
                        transaction.animation = .default
                    }
            }
        #endif
    }
}

public extension View {
    func modalPresenter<Destination: DestinationProtocol>(_ presenter: ModalPresenter<Destination>) -> some View {
        self.modifier(ModalPresenterModifier(presenter: presenter))
    }
}
