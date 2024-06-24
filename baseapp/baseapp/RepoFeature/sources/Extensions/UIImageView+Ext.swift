//
//  UIImageView+Ext.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
import UIKit


extension UIImageView {
    
    public func imageFromUrl(urlString: String) {
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { [self] in
                    image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
    
}

