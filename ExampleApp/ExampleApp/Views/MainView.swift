//
//  MainView.swift
//  ModalPresenterExample
//
//  Created by Alisher on 09.10.2024.
//

import SwiftUI
import ModalPresentationKit

struct MainView: View {
    @EnvironmentObject var presenter: ModalPresenter<ModalDestinations>

    var body: some View {
        VStack(spacing: 16) {
            Text("Modal Presenter Example App")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            Text("SwiftUI only supports one presentation at a time on the same view. This implementation automatically dismisses the current presentation before showing a new one.")
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Status display
            Group {
                if let currentStyle = presenter.currentStyle {
                    Text("Current presentation: \(String(describing: currentStyle))")
                        .foregroundStyle(.secondary)
                    if presenter.isDismissing {
                        Text("(dismissing)")
                            .foregroundStyle(.red)
                    }
                } else {
                    Text("No active presentations")
                        .foregroundStyle(.secondary)
                }
            }
            .font(.caption)
            .padding(.vertical, 8)
            
            presentationButtons
            
            Spacer()
        }
        .padding()
    }
    
    private var presentationButtons: some View {
        VStack(spacing: 12) {
            Button(action: {
                presenter.present(destination: .fullScreenCoverExample, style: .fullScreenCover)
            }, label: {
                Text("Show Full Screen Cover")
                    .foregroundStyle(.white)
                    .padding(12)
                    .frame(maxWidth: 280)
                    .background(.indigo, in: RoundedRectangle(cornerRadius: 10))
            })

            Button(action: {
                presenter.present(destination: .sheetExample, style: .sheet)
            }, label: {
                Text("Show Sheet")
                    .foregroundStyle(.white)
                    .padding(12)
                    .frame(maxWidth: 280)
                    .background(.teal, in: RoundedRectangle(cornerRadius: 10))
            })
            
            Button(action: {
                // This demonstrates proper sequencing - first show a sheet, then immediately
                // request a fullScreenCover. The presenter will properly sequence them.
                presenter.present(destination: .sheetExample, style: .sheet)
                presenter.present(destination: .fullScreenCoverExample, style: .fullScreenCover)
            }, label: {
                Text("Seamless Transitions")
                    .foregroundStyle(.white)
                    .padding(12)
                    .frame(maxWidth: 280)
                    .background(.orange, in: RoundedRectangle(cornerRadius: 10))
            })
            
            Button(action: {
                // Example of chaining presentations with custom timing
                presenter.present(destination: .sheetExample, style: .sheet)
                
                // With our new approach, this should also work with custom timing
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    presenter.present(destination: .fullScreenCoverExample, style: .fullScreenCover)
                }
            }, label: {
                Text("Delayed Transition")
                    .foregroundStyle(.white)
                    .padding(12)
                    .frame(maxWidth: 280)
                    .background(.purple, in: RoundedRectangle(cornerRadius: 10))
            })
        }
    }
}
