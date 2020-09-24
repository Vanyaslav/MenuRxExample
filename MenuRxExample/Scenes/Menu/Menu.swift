//
//  Menu.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit

extension Menu.ItemEnum {
    static let defaultItem = Menu.ItemEnum.info
}

class Menu {
    enum ItemEnum: Int, CaseIterable {
        case home = 0, select1, select2, select3, info
        
        var title: String {
            switch self {
            case .home:
                return "Home"
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
        
        var backgroundColor: UIColor {
            switch self {
            case .home:
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
}
