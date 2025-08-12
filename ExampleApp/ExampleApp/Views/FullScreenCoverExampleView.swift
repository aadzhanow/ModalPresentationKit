//
//  FullScreenCoverExampleView.swift
//  ModalPresenterExample
//
//  Created by Alisher on 09.10.2024.
//

import SwiftUI
import ModalPresentationKit

struct FullScreenCoverExampleView: View {
    @EnvironmentObject var presenter: ModalPresenter<ModalDestinations>

    var body: some View {
        VStack(spacing: 20) {
            Text("Full Screen Cover Example")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Text("You can present a sheet from within this fullScreenCover")
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Status display
            Group {
                if let currentStyle = presenter.currentStyle {
                    if presenter.isDismissing {
                        Text("Dismissing...")
                            .foregroundStyle(.red)
                    } else {
                        Text("Active: \(String(describing: currentStyle))")
                            .foregroundStyle(.green)
                    }
                }
            }
            .font(.caption)
            .padding(.vertical, 8)
            
            Button(action: {
                presenter.present(destination: .sheetExample, style: .sheet)
            }, label: {
                Text("Present Sheet")
                    .foregroundStyle(.black)
                    .padding(12)
                    .background(.white, in: RoundedRectangle(cornerRadius: 10))
            })
            
            Button(action: {
                presenter.dismiss()
            }, label: {
                Text("Dismiss")
                    .foregroundStyle(.black)
                    .padding(12)
                    .background(.white, in: RoundedRectangle(cornerRadius: 10))
            })
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.indigo)
    }
}
