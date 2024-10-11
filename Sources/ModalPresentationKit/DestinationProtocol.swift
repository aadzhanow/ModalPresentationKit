//
//  DestinationProtocol.swift
//  ModalPresentationKit
//
//  Created by Alisher on 09.10.2024.
//

import SwiftUI

public typealias DestinationProtocol = View & Identifiable

public protocol ModalDestination: DestinationProtocol {}

public extension ModalDestination {
    public var id: UUID { UUID() }
}
