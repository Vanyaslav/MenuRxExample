//
//  UISplitViewController+Root.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 14/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit


extension UISplitViewController {
    convenience init(rootViewController: UIViewController) {
        self.init()
        preferredDisplayMode = .allVisible
        viewControllers = [rootViewController]
    }
}
