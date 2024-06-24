//
//  PullRequestViewCell.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit
 
class PullRequestViewCell: UITableViewCell {
    
    private lazy var containerView: UIStackView = {
        let variable = UIStackView(arrangedSubviews: [pullRequestStackView, separatorView, spaceView])
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .vertical
        variable.spacing = 10
        return variable
    }()
 
 
    
    private lazy var pullRequestStackView: UIStackView = {
        let variable = UIStackView(arrangedSubviews: [pullRequestTitleView, pullRequestDescriptionStackView, userInfoStackView ])
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .vertical
        variable.spacing = 10.0
        return variable
    }()
    
    private lazy var pullRequestTitleView: UILabel = {
        let variable = UILabel()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.lineBreakMode = .byWordWrapping
        variable.numberOfLines = 0
        variable.textColor =  UIColor.init(resource: .blue100)
        variable.textAlignment = .left
        variable.font = UIFont.systemFont(ofSize: 19.0, weight: .semibold)
        return variable
    }()
    
    private lazy var pullRequestDescriptionStackView: UIStackView = {
        let variable = UIStackView(arrangedSubviews: [pullRequestDescriptionView,UIView()])
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .vertical
        variable.spacing = 0
        variable.heightAnchor.constraint(equalToConstant:80).isActive = true
        return variable
    }()
    
    private lazy var pullRequestDescriptionView: UILabel = {
        let variable = UILabel()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.lineBreakMode = .byTruncatingTail
        variable.numberOfLines = 0
        variable.textColor = .black
        variable.textAlignment = .left
        variable.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
       
        return variable
    }()
    
    
    private lazy var userInfoStackView: UIStackView = {
        let variable = UIStackView(arrangedSubviews: [userAvatarView,userNameView, UIView()])
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.axis = .horizontal
        variable.spacing = 6
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
 
    func setData(data: PullRequestItem) {
        
        if let title = data.title {
            pullRequestTitleView.text = title
        } else {
            pullRequestTitleView.text = ""
        }
        
        if let desc = data.body {
            pullRequestDescriptionView.text = desc
        } else {
            pullRequestDescriptionView.text = ""
        }
        
        if let avatarUrl = data.user?.avatarURL {
            userAvatarView.imageFromUrl(urlString: avatarUrl)
        } else {
            userAvatarView.image = UIImage(named:"defaultAvatar")
        }
        if let login = data.user?.login {
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
