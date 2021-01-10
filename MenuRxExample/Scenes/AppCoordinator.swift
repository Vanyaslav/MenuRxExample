//
//  AppCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 10/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import RxSwift

protocol DetailCoordinatorProtocol {
    init(splitView: UISplitViewController, item: Menu.ItemEnum?)
}

class AppCoordinator {
    let disposeBag = CompositeDisposable()
}
