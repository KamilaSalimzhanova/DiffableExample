//
//  AlertService.swift
//  DiffableDataSourceExample
//
//  Created by kamila on 02.06.2026.
//

import Foundation
import UIKit

struct AlertService {
    func createAlert(completion: @escaping (String) -> Void) -> UIAlertController {
        let alert = UIAlertController(title: "Create a user", message: nil, preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Name" }
        let createAction = UIAlertAction(title: "Create", style: .default) { _ in
            if let name = alert.textFields?.first?.text, !name.isEmpty {
                completion(name)
            }
        }
        alert.addAction(createAction)
        return alert
    }
}
