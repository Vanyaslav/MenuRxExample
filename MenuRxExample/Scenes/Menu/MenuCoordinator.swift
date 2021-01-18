//
//  MenuCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift

class MenuCoordinator: AppCoordinator {
    init(with window: UIWindow) {
        super.init()
        let context = Menu.Context()
        let model = Menu_VM(context: context)
        let menu = Menu_VC(viewModel: model)
        let rootView = UINavigationController(rootViewController: menu)
        
        let splitViewController = UISplitViewController(rootViewController: rootView)
        
        context.itemSelected
            .map{ $0.getCoordinator(with: splitViewController) }
            .subscribe()
            .disposed(by: disposeBag)
        
        window.rootViewController = splitViewController
        window.makeKeyAndVisible()
    }
}
