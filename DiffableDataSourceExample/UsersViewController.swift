//
//  UsersViewController.swift
//  DiffableDataSourceExample
//
//  Created by kamila on 02.06.2026.
//

import UIKit

final class UsersViewController: UITableViewController {
    private let screenTitle = "Users"
    private let alertService = AlertService()
    private var users: [User] = []
    
    private var dataSource: UITableViewDiffableDataSource<MySection, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RoundedCell.self, forCellReuseIdentifier: "cell")
        
        view.backgroundColor = .black
        tableView.backgroundColor = .clear
        tableView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        configureUI()
        configureDataSource()
    }
    
    private func configureUI() {
        navigationItem.title = screenTitle
        configureNavBar()
    }
    
    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<MySection, User>(tableView: tableView) {(tableView, indexPath, user)
            -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = user.name
            return cell
        }
    }
    
    private func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapAdd)
        )
    }
    
    private func createSnapshot(from users: [User]) {
        var snapshot = NSDiffableDataSourceSnapshot<MySection, User>()
        snapshot.appendSections([.main])
        snapshot.appendItems(users)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    @objc private func didTapAdd() {
        let alert = alertService.createAlert { [weak self] name in
            guard let self else { return }
            
            users.append(User(name: name))
            createSnapshot(from: users)
        }
        present(alert, animated: true)
    }
}
