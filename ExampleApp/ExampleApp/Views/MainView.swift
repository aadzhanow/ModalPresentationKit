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
        VStack {
            Text("This is Modal Presenter Example App")
                .font(.title)
                .multilineTextAlignment(.center)

            Button(action: {
                presenter.present(destination: .fullScreenCoverExample, style: .fullScreenCover)
            }, label: {
                Text("Full Screen Cover Example")
                    .foregroundStyle(.white)
                    .padding(12)
                    .background(.indigo, in: RoundedRectangle(cornerRadius: 10))
            })

            Button(action: {
                presenter.present(destination: .sheetExample, style: .sheet)
            }, label: {
                Text("Sheet Example")
                    .foregroundStyle(.white)
                    .padding(12)
                    .background(.teal, in: RoundedRectangle(cornerRadius: 10))
            })
        }
        .padding()
    }
}
