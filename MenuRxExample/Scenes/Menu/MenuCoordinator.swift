//
//  MenuCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift

class MenuCoordinator {
    private
    let disposeBag = DisposeBag()
    
    init(with window: UIWindow) {
        let context = Menu.Context()
        let model = Menu_VM(context: context)
        let menu = Menu_VC(viewModel: model)
        let rootView = UINavigationController(rootViewController: menu)
        
        let sv = UISplitViewController()
        sv.preferredDisplayMode = .allVisible
        sv.viewControllers = [rootView]
        
        window.rootViewController = sv
        window.makeKeyAndVisible()
        
        context.itemSelected
            .filter{ $0.isDeployed }
            .map{ _ in sv }
            .map(PresetCoordinator.init)
            .subscribe()
            .disposed(by: disposeBag)

        context.itemSelected
            .filter{ !$0.isDeployed }
            .subscribe(onNext:{ item in
                let vc = Selection_VC(with: Selection_VM(with: item))
                let nc = UINavigationController(rootViewController: vc)
                sv.showDetailViewController(nc, sender: nil) })
            .disposed(by: disposeBag)
    }
}
