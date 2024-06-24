//
//  PullRequestListView.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//


import UIKit
 
protocol PullRequestListViewDelegate: AnyObject {
    func gotoDetail(selectedPr: PullRequestItem)
}

final class PullRequestListView: UIView{
    
    weak var delegate: PullRequestListViewDelegate?
   
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var topbarView: UIStackView = {
        let variable = UIStackView(arrangedSubviews: [pullRequestOpenCountTitleView, pullRequestCloseCountTitleView, UIView()])
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.isLayoutMarginsRelativeArrangement = true
        variable.layoutMargins = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        variable.axis = .horizontal
        variable.backgroundColor = UIColor.init(resource: .neultral10)
        variable.spacing = 10
        variable.heightAnchor.constraint(equalToConstant:40).isActive = true
        variable.isHidden = true
        return variable
    }()
    
    private lazy var pullRequestOpenCountTitleView: UILabel = {
        let variable = UILabel()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.lineBreakMode = .byWordWrapping
        variable.numberOfLines = 0
        variable.textColor =  UIColor.init(resource: .yellow100)
        variable.textAlignment = .left
        variable.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        return variable
    }()
    
    private lazy var pullRequestCloseCountTitleView: UILabel = {
        let variable = UILabel()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.lineBreakMode = .byWordWrapping
        variable.numberOfLines = 0
        variable.textColor =  .black
        variable.textAlignment = .left
        variable.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        return variable
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(PullRequestViewCell.self)
        tableView.showsVerticalScrollIndicator = true
        tableView.alwaysBounceVertical = false
        tableView.allowsSelection = true
        return tableView
    }()
 
    
 
    let dataSource =  PullRequestListTableViewDataSource()
 
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
       
        contentStackView.addArrangedSubview(topbarView)
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
 
    func updateState(with data: PullRequestResponse) {
        pullRequestOpenCountTitleView.text = "\(data.totalOpened) Opened"
        pullRequestCloseCountTitleView.text = "/ \(data.totalClosed) Closed"
        topbarView.isHidden = false
        dataSource.updateItems(data.items)
        tableView.reloadData()
    }
 
}
 
extension PullRequestListView: PullRequestListTableViewDataSourceDelegate {
    func didSelect(data: PullRequestItem) {
        self.delegate?.gotoDetail(selectedPr: data)
    }
}
