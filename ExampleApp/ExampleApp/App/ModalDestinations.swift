//
//  ModalDestinations.swift
//  ModalPresenterExample
//
//  Created by Alisher on 09.10.2024.
//

import SwiftUI
import ModalPresentationKit

enum ModalDestinations: ModalDestination {
    case fullScreenCoverExample
    case sheetExample
    
    var body: some View {
        switch self {
        case .fullScreenCoverExample:
            FullScreenCoverExampleView()
        case .sheetExample:
            SheetExampleView()
        }
    }
}
