//
//  ModalPresenter.swift
//  ModalPresentationKit
//
//  Created by Alisher on 09.10.2024.
//

import SwiftUI

public enum PresentationStyle {
    case sheet
    #if os(iOS) || os(tvOS)
    case fullScreenCover
    #endif
}

public final class ModalPresenter<Destination: DestinationProtocol>: ObservableObject {
    @Published public var sheetDestination: Destination?
    #if os(iOS) || os(tvOS)
    @Published public var fullScreenCoverDestination: Destination?
    #endif

    private var activePresentationStyles: Set<PresentationStyle> = []
    
    public init() {}

    public func present(destination: Destination, style: PresentationStyle) {
        // First dismiss any active presentations
        dismiss()
        
        // Then present the new one
        activePresentationStyles.insert(style)
        switch style {
        case .sheet:
            sheetDestination = destination
        #if os(iOS) || os(tvOS)
        case .fullScreenCover:
            fullScreenCoverDestination = destination
        #endif
        }
    }

    public func dismiss(style: PresentationStyle? = nil) {
        if let style = style {
            // Dismiss specific style
            activePresentationStyles.remove(style)
            switch style {
            case .sheet:
                sheetDestination = nil
            #if os(iOS) || os(tvOS)
            case .fullScreenCover:
                fullScreenCoverDestination = nil
            #endif
            }
        } else {
            // Dismiss all active presentations
            activePresentationStyles.removeAll()
            
            sheetDestination = nil
            #if os(iOS) || os(tvOS)
            fullScreenCoverDestination = nil
            #endif
        }
    }
}
