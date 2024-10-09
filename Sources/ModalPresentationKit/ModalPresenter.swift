//
//  ModalPresenter.swift
//  ModalPresentationKit
//
//  Created by Alisher on 09.10.2024.
//

import SwiftUI

public enum PresentationStyle {
    case sheet
    case fullScreenCover
}

public final class ModalPresenter<Destination: DestinationProtocol>: ObservableObject {
    @Published public var sheetDestination: Destination?
    @Published public var fullScreenCoverDestination: Destination?

    private var currentPresentationStyle: PresentationStyle?

    public init() {}

    public func present(destination: Destination, style: PresentationStyle) {
        currentPresentationStyle = style
        switch style {
        case .sheet:
            sheetDestination = destination
        case .fullScreenCover:
            fullScreenCoverDestination = destination
        }
    }

    public func dismiss() {
        switch currentPresentationStyle {
        case .sheet:
            sheetDestination = nil
        case .fullScreenCover:
            fullScreenCoverDestination = nil
        case .none:
            break
        }
        currentPresentationStyle = nil
    }
}
