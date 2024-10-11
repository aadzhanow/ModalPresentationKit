//
//  DestinationProtocol.swift
//  ModalPresentationKit
//
//  Created by Alisher on 09.10.2024.
//

// DestinationProtocol.swift

import SwiftUI

public protocol BaseDestinationProtocol: View, Identifiable, Hashable {}

public extension BaseDestinationProtocol where Self: Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

public extension BaseDestinationProtocol {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public typealias DestinationProtocol = BaseDestinationProtocol
