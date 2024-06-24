//
//  UITableView+Ext.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit

extension UITableView {
    
    public func register<T:UITableViewCell>(_:T.Type){
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    public func dequeueReusableCell<T:UITableViewCell>(with identifier: String, for indexPath:IndexPath)-> T{
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("could not dequeue cell with identifier: \(identifier)")
        }
        return cell
    }
    public func dequeueReusableCell<T:UITableViewCell>(for indexPath:IndexPath, cellType: T.Type = T.self)-> T{
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("could not dequeue cell with identifier: \(cellType.reuseIdentifier)")
        }
        return cell
    }
}


extension UITableViewCell: ReusableView {}

public protocol ReusableView  : AnyObject {
    static var reuseIdentifier: String {
       get
    }
}
extension ReusableView where Self: UIView {
    public static var reuseIdentifier: String {
        return String(describing:self)
    }
}
