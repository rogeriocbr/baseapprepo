//
//  RepoListViewController.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit
import Combine

final class RepoListViewController: UIViewController {
 
    private weak  var delegate: RepoListFlowControllerDelegate?
    let contentView: RepoListView
    private var viewModel: RepoListViewModelProtocol
    private var indicatorView: UIView?
    private var cancellables: Set<AnyCancellable> = []
    
    init(contentView: RepoListView, viewModel: RepoListViewModelProtocol, delegate: RepoListFlowControllerDelegate) {
        self.delegate = delegate
        self.contentView = contentView
        self.viewModel = viewModel
 
        super.init(nibName: nil, bundle: nil)
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindViewModelActions()
        bindContentViewActions()
        viewModel.getData()
        
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
       
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
 
    private func setup() {
        self.title = "Repositories"
        self.view.backgroundColor = .white
        contentSetup()
        
    }
 
    private func contentSetup() {
        view.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
      
    }
 
    private func bindViewModelActions() {
 
        viewModel.subjectGetData.sink(receiveCompletion: {[weak self] result in
            guard let self else { return }
            switch result {
            case .finished:
                break
            case .failure(let error):
                let alert = UIAlertController(title: "Warning", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
           
        }, receiveValue: { [weak self] data in
            guard let self else { return }
            contentView.updateState(with: data)
        }) .store(in: &cancellables)
 
        viewModel.state.sink { [weak self] state in
            guard let self else { return }
            switch state {
            case .processing:
                indicatorView =  view.showActivityIndicator()
            default:
                if let view = indicatorView {
                    view.removeFromSuperview()
                }
            }
        }.store(in: &cancellables)
        
    }
    
    private func bindContentViewActions() {
        self.contentView.delegate = self
    }
   
}
extension RepoListViewController: RepoListViewDelegate {
    func gotoDetail(selectedRepo: RepositoryItem){
        self.delegate?.flowToDetailView(selectedRepo)
    }
    func loadMore() {
        self.viewModel.getData()
    }
}
