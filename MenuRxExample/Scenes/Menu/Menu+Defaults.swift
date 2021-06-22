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
    static let defaultItem: Menu.ItemEnum = .info
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
                .yellow
                .withAlphaComponent(0.3)
        }
    }
    
    var title: String {
        switch self {
        case .preset:
            return "Presets"
        case .select1:
            return "First selection"
        case .select2:
            return "Second selection"
        case .select3:
            return "Third selection"
        case .info:
            return "Info"
        }
    }
}
