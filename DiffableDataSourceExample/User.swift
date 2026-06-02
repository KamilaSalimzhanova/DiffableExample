//
//  User.swift
//  DiffableDataSourceExample
//
//  Created by kamila on 02.06.2026.
//

import Foundation

struct User: Hashable, Sendable {
    let id: UUID = UUID()
    let name: String
}
