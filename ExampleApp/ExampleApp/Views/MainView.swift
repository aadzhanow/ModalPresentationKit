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
                // This will first dismiss any active presentation, then show the full screen cover
                presenter.present(destination: .fullScreenCoverExample, style: .fullScreenCover)
            }, label: {
                Text("Switch to Full Screen Cover")
                    .foregroundStyle(.white)
                    .padding(12)
                    .frame(maxWidth: 280)
                    .background(.orange, in: RoundedRectangle(cornerRadius: 10))
            })
        }
    }
}
