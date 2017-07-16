//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by Fco. Javier Guerrero Carmona on 11/7/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

// Esto lo hacemos para que a cada UIViewController me lo devuelve en un Navigation Controller

extension UIViewController {
    func wrappedInNavigation() -> UINavigationController{
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
}
