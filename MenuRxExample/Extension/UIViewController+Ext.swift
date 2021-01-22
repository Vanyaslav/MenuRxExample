//
//  UIViewController+Ext.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 10/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

// self as a managing controller
extension UIViewController {
    func showScene(with vc: UIViewController,
                        nc: UINavigationController?) {
        // UISplitViewController solution
        if let controller = self as? UISplitViewController {
            if let nc = nc {
                nc.addChild(vc)
                controller.showDetailViewController(nc, sender: nil)
            } else {
                controller.showDetailViewController(vc, sender: nil)
            }
        } else {
            print("Solution with controller: \(self) not implemented!")
        }
    }
}
