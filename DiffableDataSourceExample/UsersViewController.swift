//
//  UsersViewController.swift
//  DiffableDataSourceExample
//
//  Created by kamila on 02.06.2026.
//

import UIKit

class UsersViewController: UITableViewController {
    private let screenTitle = "Users"
    private let alertService = AlertService()
    private var users: [User] = []
    
    nonisolated(unsafe) private var dataSource: UITableViewDiffableDataSource<MySection, User>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        configureUI()
    }
    
    private func configureUI() {
        navigationItem.title = screenTitle
        configureNavBar()
    }
    
    
    private func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapAdd)
        )
    }
    
    @objc private func didTapAdd() {
        let alert = alertService.createAlert { [weak self] name in
            print(name)
        }
        present(alert, animated: true)
    }
}
