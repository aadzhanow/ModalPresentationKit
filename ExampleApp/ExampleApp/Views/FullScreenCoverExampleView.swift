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
        VStack {
            Text("This is Full Screen Cover Example")
                .font(.title)
                .multilineTextAlignment(.center)
            
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
