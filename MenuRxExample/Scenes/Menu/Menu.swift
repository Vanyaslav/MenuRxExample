//
//  Menu.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift

extension Menu {
    class Context {
        let itemSelected = PublishSubject<ItemEnum>()
    }
}

class Menu {
    enum ItemEnum: Int, CaseIterable {
        case preset = 0, select1, select2, select3, info
    }
}
