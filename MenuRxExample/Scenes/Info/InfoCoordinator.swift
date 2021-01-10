//
//  InfoCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 10/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

class InfoCoordinator: DetailCoordinatorProtocol {
    required init(splitView: UISplitViewController, item: Menu.ItemEnum? = nil) {
        let infoView = Info_VC()
        let nc = UINavigationController(rootViewController: infoView)
        splitView.showDetailViewController(nc, sender: nil)
    }
}
