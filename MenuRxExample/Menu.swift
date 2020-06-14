//
//  Menu.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift

class Menu {
    enum Item: Int, CaseIterable {
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
    }
}
//
extension Menu {
    class Context {
        let itemSelected = PublishSubject<Item>()
    }
}
