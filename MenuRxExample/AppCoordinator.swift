//
//  MenuCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator {
    private let disposeBag = DisposeBag()
    private let window: UIWindow
    
    init(with window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
        
        #if DEBUG
        Observable<Int>
            .interval(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe(onNext: { _ in  print("Resource count \(RxSwift.Resources.total)") })
            .disposed(by: disposeBag)
        #endif
    }
    
    func start() {
        let context = Menu.Context()
        let model = Menu_VM(context: context)
        let menu = Menu_VC(viewModel: model)
        let rootView = UINavigationController(rootViewController: menu)
        
        let sv = UISplitViewController()
        sv.preferredDisplayMode = .allVisible
        sv.viewControllers = [rootView]
        
        window.rootViewController = sv
        //
        context.itemSelected
            .startWith(Menu.defaultPage)
            .subscribe(onNext:{ item in
                sv.showDetailViewController(UINavigationController(rootViewController: Selection_VC(with: Selection_VM(with: item))),
                                            sender: nil) })
            .disposed(by: disposeBag)
    }
}
