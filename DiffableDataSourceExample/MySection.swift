//
//  MySection.swift
//  DiffableDataSourceExample
//
//  Created by kamila on 02.06.2026.
//

enum MySection: Sendable {
    case main
}

nonisolated extension MySection: Hashable {}
