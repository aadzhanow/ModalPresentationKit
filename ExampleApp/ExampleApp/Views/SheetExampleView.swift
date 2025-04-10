//
//  SheetExampleView.swift
//  ModalPresenterExample
//
//  Created by Alisher on 09.10.2024.
//

import SwiftUI
import ModalPresentationKit

struct SheetExampleView: View {
    @EnvironmentObject var presenter: ModalPresenter<ModalDestinations>

    var body: some View {
        VStack(spacing: 20) {
            Text("Sheet Example")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Text("You can present a fullScreenCover from within this sheet")
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: {
                presenter.present(destination: .fullScreenCoverExample, style: .fullScreenCover)
            }, label: {
                Text("Show Full Screen Cover")
                    .foregroundStyle(.black)
                    .padding(12)
                    .background(.white, in: RoundedRectangle(cornerRadius: 10))
            })
            
            Button(action: {
                presenter.dismiss(style: .sheet)
            }, label: {
                Text("Dismiss Sheet")
                    .foregroundStyle(.black)
                    .padding(12)
                    .background(.white, in: RoundedRectangle(cornerRadius: 10))
            })
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.teal)
    }
}
