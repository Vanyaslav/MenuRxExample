//
//  UIViewController+Ext.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 10/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

extension UIViewController {
    func manageChild(with vc: UIViewController,
                     nc: UINavigationController?) {
        // UISplitViewController solution
        if let controller = self as? UISplitViewController {
            if let nc = nc {
                nc.addChild(vc)
                controller.showDetailViewController(nc, sender: nil)
            } else {
                controller.showDetailViewController(vc, sender: nil)
            }
        }
    }
}
