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
    
    // Track the currently active presentation style, if any
    @Published private(set) public var currentStyle: PresentationStyle?
    
    // Flag to track if a dismissal is in progress
    @Published private(set) public var isDismissing = false
    
    // The next presentation that should happen after dismissal completes
    private var nextPresentation: (destination: Destination, style: PresentationStyle)?
    
    public init() {}
    
    public func present(destination: Destination, style: PresentationStyle) {
        if let currentStyle = currentStyle {
            // Store the next presentation and initiate dismissal
            nextPresentation = (destination, style)
            dismiss(style: currentStyle)
        } else {
            // No active presentation, present immediately
            presentImmediately(destination: destination, style: style)
        }
    }
    
    private func presentImmediately(destination: Destination, style: PresentationStyle) {
        self.currentStyle = style
        
        switch style {
        case .sheet:
            self.sheetDestination = destination
        #if os(iOS) || os(tvOS)
        case .fullScreenCover:
            self.fullScreenCoverDestination = destination
        #endif
        }
    }
    
    public func dismiss(style: PresentationStyle? = nil) {
        // If a specific style is provided, only dismiss if it matches the current style
        if let style = style, style != currentStyle {
            return
        }
        
        isDismissing = true
        
        switch currentStyle {
        case .sheet:
            sheetDestination = nil
        #if os(iOS) || os(tvOS)
        case .fullScreenCover:
            fullScreenCoverDestination = nil
        #endif
        case .none:
            break
        }
        
        currentStyle = nil
    }
    
    // This is called from the onDismiss callback of sheet/fullScreenCover
    public func didCompleteDismissal(of style: PresentationStyle) {
        isDismissing = false
        
        // If we have a next presentation waiting, present it now
        if let next = nextPresentation {
            nextPresentation = nil
            presentImmediately(destination: next.destination, style: next.style)
        }
    }
}
