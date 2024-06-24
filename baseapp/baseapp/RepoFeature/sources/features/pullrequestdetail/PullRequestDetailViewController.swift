//
//  PullRequestDetailViewController.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit

class PullRequestDetailViewController: UIViewController {
    

    private var contentView: PullRequestDetailView
    private var viewModel: PullRequestDetailViewModelProtocol
    
    init(contentView:PullRequestDetailView, viewModel: PullRequestDetailViewModelProtocol) {
        
        self.contentView = contentView
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        print("dealloc..")
    }
    required init?(coder: NSCoder) {
         return nil
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contentView.setData(data: viewModel.getPullRequestURL())
       
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        view.addSubview(contentView)
        contentView.content.translatesAutoresizingMaskIntoConstraints = false
        contentView.content.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        contentView.content.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.content.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contentView.content.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
       
         
    }
    
    

}
