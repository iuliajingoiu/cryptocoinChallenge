//
//  AssetsTableViewController.swift
//  CryptocoinChallenge
//
//  Created by Iulia Jingoiu on 22/07/2020.
//  Copyright © 2020 Iulia Jingoiu. All rights reserved.
//

import UIKit

class AssetsTableViewController: UIViewController {

    private(set) var tableView: UITableView!
    private(set) var collectionsViewModel = CollectionsViewModel()
    
    var dataSource: [AssetsBaseProtocol]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Init
    init(data: [AssetsBaseProtocol]) {
        self.dataSource = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CollectionTableCell.self, forCellReuseIdentifier: "CollectionTableCell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.tableView = tableView
    }
    
}

// MARK: - TableViewDelegate + DataSource
extension AssetsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableCell", for: indexPath) as! CollectionTableCell
        let cellModel = dataSource[indexPath.row]
        cell.setupWith(model: cellModel)
        return cell
    }
}

extension AssetsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        displayMissingFeature()
    }
}

