//
//  RepoListView.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit
 
 
protocol RepoListViewDelegate: AnyObject {
    func gotoDetail(selectedRepo: RepositoryItem)
    func loadMore()
}

final class RepoListView: UIView{
    
    weak var delegate: RepoListViewDelegate?
 
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(RepoViewCell.self)
        tableView.showsVerticalScrollIndicator = true
        tableView.alwaysBounceVertical = false
        tableView.allowsSelection = true
        return tableView
    }()
 
    
 
    let dataSource =  RepoListTableViewDataSource()
 
    init() {
        super.init(frame: .zero)
        setup()
        dataSource.delegate = self
    }
 
    required init?(coder: NSCoder) {
        return nil
    }
 
    private func setup() {
        buildViewHierarchy()
        addConstraints()
        setupTableView()
       
    }
 
    private func buildViewHierarchy() {
        addSubview(contentStackView)
       
        contentStackView.addArrangedSubview(UIView())
        contentStackView.addArrangedSubview(tableView)
       
    }
 
    private func addConstraints() {
        
        contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        
        
        tableView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: contentStackView.widthAnchor).isActive = true
 
        
    }
 
    func setupTableView() {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }
 
    func updateState(with data: [RepositoryItem]) {
        
        dataSource.updateItems(data)
        tableView.reloadData()
    }
 
}
 
extension RepoListView: RepoListTableViewDataSourceDelegate {
    func didLoadNextPage() {
        self.delegate?.loadMore()
    }
    
    func didSelect(data: RepositoryItem) {
        self.delegate?.gotoDetail(selectedRepo: data)
    }
}
