//
//  SelectionCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 10/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

class SelectionCoordinator: DetailCoordinatorProtocol {    
    required init(controller: UIViewController,
                  nc: UINavigationController?,
                  item: Menu.ItemEnum?) {
        guard let menuItem = item else { return }
        let vc = Selection_VC(with: Selection_VM(with: menuItem))        
        controller.manageChild(with: vc, nc: nc)
    }
}
