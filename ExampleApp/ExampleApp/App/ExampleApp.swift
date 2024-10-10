//
//  ExampleApp.swift
//  ModalPresenterExample
//
//  Created by Alisher on 09.10.2024.
//

import SwiftUI
import ModalPresentationKit

@main
struct ExampleApp: App {
    @StateObject var presenter = ModalPresenter<ModalDestinations>()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(presenter)
                .modalPresenter(presenter)
        }
    }
}
