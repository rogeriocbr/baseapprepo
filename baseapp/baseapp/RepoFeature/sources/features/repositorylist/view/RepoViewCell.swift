//
//  RepoViewCell.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit
 
class RepoViewCell: UITableViewCell {
    
    private lazy var containerView: UIStackView = {
        let variable = UIStackView(arrangedSubviews: [mainStackView, separatorView, spaceView])
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .vertical
        variable.spacing = 10
        return variable
    }()
 
    private lazy var mainStackView: UIStackView = {
        let variable = UIStackView(arrangedSubviews: [repositoryStackView, userInfoStackView])
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .horizontal
        return variable
    }()
 
    
    private lazy var repositoryStackView: UIStackView = {
        let variable = UIStackView(arrangedSubviews: [repositoryTitleView, repositoryDescriptionStackView, repositoryStatiscsStackView ])
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .vertical
        variable.spacing = 10.0
        return variable
    }()
    
    private lazy var repositoryTitleView: UILabel = {
        let variable = UILabel()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.lineBreakMode = .byWordWrapping
        variable.numberOfLines = 0
        variable.textColor =  UIColor.init(resource: .blue100)
        variable.textAlignment = .left
        variable.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        return variable
    }()
    
    private lazy var repositoryDescriptionStackView: UIStackView = {
        let variable = UIStackView(arrangedSubviews: [repositoryDescriptionView,UIView()])
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .vertical
        variable.spacing = 0
        variable.heightAnchor.constraint(equalToConstant:80).isActive = true
        return variable
    }()
    
    private lazy var repositoryDescriptionView: UILabel = {
        let variable = UILabel()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.lineBreakMode = .byTruncatingTail
        variable.numberOfLines = 0
        variable.textColor = .black
        variable.textAlignment = .left
        variable.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
       
        return variable
    }()
    
    private lazy var repositoryStatiscsStackView: UIStackView = {
        let variable = UIStackView(arrangedSubviews: [repositoryForksStackView,repositoryStarsStackView])
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .horizontal
        variable.spacing = 10
       
        return variable
    }()
   
    private lazy var repositoryForksStackView: UIStackView = {
        let variable = UIStackView()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .horizontal
        variable.spacing = 10.0
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named:"repoFork")
        icon.widthAnchor.constraint(equalToConstant:20).isActive = true
        variable.addArrangedSubview(icon)
        variable.addArrangedSubview(repositoryForksCountView)
        variable.widthAnchor.constraint(equalToConstant:80).isActive = true
        variable.heightAnchor.constraint(equalToConstant:40).isActive = true
        return variable
    }()
    
    private lazy var repositoryForksCountView: UILabel = {
        let variable = UILabel()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.lineBreakMode = .byTruncatingTail
        variable.numberOfLines = 1
        variable.textColor = UIColor.init(resource: .yellow100)
        variable.textAlignment = .left
        variable.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
        variable.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return variable
    }()
    
   
    
    private lazy var repositoryStarsStackView: UIStackView = {
        let variable = UIStackView()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .horizontal
        variable.spacing = 10.0
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named:"repoStar")
        icon.widthAnchor.constraint(equalToConstant:20).isActive = true
        variable.addArrangedSubview(icon)
        variable.addArrangedSubview(repositoryStarsCountView)
        return variable
    }()
    
    
    private lazy var repositoryStarsCountView: UILabel = {
        let variable = UILabel()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.lineBreakMode = .byTruncatingTail
        variable.numberOfLines = 1
        variable.textColor = UIColor.init(resource: .yellow100)
        variable.textAlignment = .left
        variable.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
        variable.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return variable
    }()
    
    private lazy var userInfoStackView: UIStackView = {
        let variable = UIStackView(arrangedSubviews: [userAvatarView,userNameView,userFullNameView, UIView()])
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .vertical
        variable.spacing = 10
        return variable
    }()
    
    private lazy var userAvatarView: UIImageView = {
        let variable = UIImageView()
        variable.contentMode = .scaleAspectFill
        variable.backgroundColor = .black
        variable.layer.cornerRadius = 30.0
        variable.layer.masksToBounds = false
        variable.clipsToBounds = true
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.widthAnchor.constraint(equalToConstant:60).isActive = true
        variable.heightAnchor.constraint(equalToConstant:60).isActive = true
        return variable
    }()
 
    private lazy var userNameView: UILabel = {
        let variable = UILabel()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.lineBreakMode = .byWordWrapping
        variable.numberOfLines = 0
        variable.textColor = UIColor.init(resource: .blue20)
        variable.textAlignment = .center
        variable.font = UIFont.systemFont(ofSize: 12.0, weight: .semibold)
        return variable
    }()
    
    private lazy var userFullNameView: UILabel = {
        let variable = UILabel()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.lineBreakMode = .byWordWrapping
        variable.numberOfLines = 0
        variable.textColor = .gray
        variable.textAlignment = .center
        variable.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        return variable
    }()
    private lazy var separatorView: UIView = {
        let variable = UIView()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.backgroundColor = UIColor.init(resource: .neultral20)
        variable.heightAnchor.constraint(equalToConstant:1).isActive = true
        return variable
    }()
    
    private lazy var spaceView: UIView = {
        let variable = UIView()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.backgroundColor = .clear
        variable.heightAnchor.constraint(equalToConstant:10).isActive = true
        return variable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
 
    required init?(coder: NSCoder) {
        return nil
    }
 
    private func setup() {
 
        backgroundColor = .clear
        selectionStyle = .gray
        buildViewHierarchy()
        addConstraints()
    }
 
    func setData(data: RepositoryItem) {
        
        if let title = data.name {
            repositoryTitleView.text = title
        } else {
            repositoryTitleView.text = ""
        }
        
        if let desc = data.description {
            repositoryDescriptionView.text = desc
        } else {
            repositoryDescriptionView.text = ""
        }
        
        if let forksCount = data.forksCount {
            repositoryForksCountView.text = "\(forksCount)"
        } else {
            repositoryForksCountView.text = "0"
        }
        
        if let starsCount = data.score {
            repositoryStarsCountView.text = "\(starsCount)"
        } else {
            repositoryStarsCountView.text = "0"
        }
        if let avatarUrl = data.owner?.avatarURL {
            userAvatarView.imageFromUrl(urlString: avatarUrl)
        } else {
            userAvatarView.image = UIImage(named:"defaultAvatar")
        }
        if let login = data.owner?.login {
            userNameView.text = login
        } else {
            userNameView.text = ""
        }
         
    }
 
    private func buildViewHierarchy() {
        addSubview(containerView)
    }
 
    private func addConstraints() {
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:6).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
 
    }
}
