//
//  PullRequestDetailView.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit
import WebKit

class PullRequestDetailView: UIView {
    
    var pullRequestUrl: URL?
    
    var content: UIView {
        return self
    }
    private lazy var webView: WKWebView = {
        let variable = WKWebView()
        variable.translatesAutoresizingMaskIntoConstraints = false
        variable.allowsBackForwardNavigationGestures = true
        return variable
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    func setup()  {
        
        addSubview(webView)
    
        webView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        webView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        webView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        webView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
        
    }
    
    func setData(data: URL?) {
        
        pullRequestUrl = data
        
        if let pullRequestUrl {
            webView.load(URLRequest(url: pullRequestUrl))
        }
            
    }
 
}
