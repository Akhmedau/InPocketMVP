//
//  UIView.ext.swift
//  InPocketMVP
//
//  Created by АХМЕДОВ НИКОЛАЙ on 10/02/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    static func configure<T: UIView>(view: T, block: @escaping (T) -> ()) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        block(view)
        return view
    }
    
    func setViewGradient(frame: CGRect, startPoint: CGPoint, endPoint: CGPoint, colors: [UIColor], location: [NSNumber]){
        
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{
            $0.cgColor
        }
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.locations = location
        
        self.layer.addSublayer(gradient)
    }
}
