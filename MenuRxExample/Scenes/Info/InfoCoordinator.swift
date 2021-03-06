//
//  InfoCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 10/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

class InfoCoordinator: DetailCoordinatorProtocol {
    required init(controller: UIViewController,
                  nc: UINavigationController? = nil,
                  item: Menu.ItemEnum? = nil) {
        let vc = Info_VC(with: item)
        controller.showScene(with: vc, nc: nc)
    }
}
