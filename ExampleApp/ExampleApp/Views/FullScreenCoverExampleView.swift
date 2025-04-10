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
            
            Button(action: {
                presenter.present(destination: .sheetExample, style: .sheet)
            }, label: {
                Text("Show Sheet")
                    .foregroundStyle(.black)
                    .padding(12)
                    .background(.white, in: RoundedRectangle(cornerRadius: 10))
            })
            
            Button(action: {
                presenter.dismiss(style: .fullScreenCover)
            }, label: {
                Text("Dismiss Full Screen Cover")
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
