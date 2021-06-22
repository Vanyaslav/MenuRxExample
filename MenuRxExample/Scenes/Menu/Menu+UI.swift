//
//  Menu+UI.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 22/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

extension Menu.ItemEnum {
    /// control items of the menu
    static let controlItems = Menu.ItemEnum
        .allCases
        .map{ MenuItemButton(text: $0.title, tag: $0.rawValue) }
    /// related coordinators
    func getCoordinator(with vc: UIViewController) -> DetailCoordinatorProtocol {
        let nc = UINavigationController()
        switch self {
        case .preset:
            return PresetCoordinator(controller: vc, nc: nc)
            // No navigation Bar for splited view iPhone Max, iPad
        case .info:
            return InfoCoordinator(controller: vc, item: self)
        default:
            return SelectionCoordinator(controller: vc, nc: nc, item: self)
        }
    }
}
