//
//  UIStoryboard.swift
//  GoogleBooks
//
//  Created by Vo Tung on 20/01/2019.
//  Copyright © 2019 Vo Tung. All rights reserved.
//

import UIKit

extension UIStoryboard {
    // Easily initiate view controller (for testing,...)
    static func viewController<T: UIViewController>(from storyboardName: String, type: T.Type) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}
