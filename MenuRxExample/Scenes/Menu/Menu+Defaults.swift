//
//  Menu+Defaults.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 09/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

// item that is selected on start of the app
extension Menu.ItemEnum {
    static
    let defaultItem: Menu.ItemEnum = .preset
}

extension Menu.ItemEnum {
    func getCoordinator(with view: UISplitViewController) -> DetailCoordinatorProtocol {
        switch self {
        case .preset: return PresetCoordinator(splitView: view)
        default: return SelectionCoordinator(splitView: view, item: self)
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
            return .black
        }
    }
}
