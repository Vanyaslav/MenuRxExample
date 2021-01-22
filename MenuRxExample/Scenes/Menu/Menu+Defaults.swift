//
//  Menu+Defaults.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 09/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

extension Menu.ItemEnum {
    /// selected item when the app starts
    static
    let defaultItem: Menu.ItemEnum = .preset
    /// control items of the menu
    static
    let controlItems = Menu.ItemEnum
        .allCases
        .map{ MenuItemButton(text: $0.title, tag: $0.rawValue) }
}

extension Menu.ItemEnum {
    func getCoordinator(with vc: UISplitViewController) -> DetailCoordinatorProtocol {
        let nc = UINavigationController()
        switch self {
        case .preset: return PresetCoordinator(controller: vc, nc: nc)
            // No navigation Bar for splited view iPhone Max, iPad
        case .info: return InfoCoordinator(controller: vc, item: self)
        default: return SelectionCoordinator(controller: vc, nc: nc, item: self)
        }
    }
}

extension Menu.ItemEnum {
    var backgroundColor: UIColor {
        switch self {
        case .preset:
            return .cyan
        case .select1:
            return .systemIndigo
        case .select2:
            return .orange
        case .select3:
            return .magenta
        case .info:
            return UIColor
                .label
                .withAlphaComponent(0.3)
        }
    }
}
