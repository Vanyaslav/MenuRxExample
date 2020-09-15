//
//  Menu+Context.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 14/09/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift

extension Menu {
    class Context {
        let itemSelected = PublishSubject<ItemEnum>()
    }
}
