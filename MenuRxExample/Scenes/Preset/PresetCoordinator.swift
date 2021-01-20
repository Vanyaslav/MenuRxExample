//
//  PresetCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 03/11/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift

class PresetCoordinator: DetailCoordinator {
    private
    let navigation: UINavigationController?
    
    required init(controller: UIViewController,
                  nc: UINavigationController?,
                  item: Menu.ItemEnum? = nil) {
        self.navigation = nc
        super.init()
        let context = Preset.Context()
        let vc = Preset_VC(viewModel: Preset_VM(context: context))
        controller.manageChild(with: vc, nc: navigation)
        
        context.showPresetInfo
            .subscribeNext(weak: self, PresetCoordinator.showPresetDetails)
            .disposed(by: disposeBag)
        
        context.showCreatePresetAlert
            .map{ context }
            .map(vc.showCreatePresetAlert)
            .subscribe()
            .disposed(by: disposeBag)
        
        context.dispose
            .map{ [self] in disposeBag.dispose() }
            .subscribe()
            .disposed(by: disposeBag)
    }
    
    private
    func showPresetDetails(with title: String) {
        _ = PresetDetailCoordinator(with: title,
                                    navigation: navigation ?? UINavigationController())
    }
}
