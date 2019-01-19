//
//  UINavigationViewController + Ext.swift
//  FoodPin
//
//  Created by Makan Fofana on 1/16/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
