//
//  SelectionCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 10/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift

class SelectionCoordinator: DetailCoordinatorProtocol {    
    required
    init(splitView: UISplitViewController, item: Menu.ItemEnum?) {
        guard let menuItem = item else { return }
        let vc = Selection_VC(with: Selection_VM(with: menuItem))
        let nc = UINavigationController(rootViewController: vc)
        splitView.showDetailViewController(nc, sender: nil)
    }
}
