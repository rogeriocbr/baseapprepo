//
//  UIView+Ext.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//


import Foundation
import UIKit


extension UIView {
    func showActivityIndicator() -> UIView {
        let container: UIView = UIView()
        container.frame = self.frame
        container.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = .init(origin: .init(x: 0, y: 0), size: .init(width: 40, height: 40))
        actInd.center = container.center
        actInd.hidesWhenStopped = true
        actInd.style =  UIActivityIndicatorView.Style.large
        container.addSubview(actInd)
        addSubview(container)
        actInd.startAnimating()
        return container
    }
}

