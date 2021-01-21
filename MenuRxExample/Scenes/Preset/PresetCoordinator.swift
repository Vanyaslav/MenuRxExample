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
    required init(controller: UIViewController,
                  nc: UINavigationController?,
                  item: Menu.ItemEnum? = nil) {
        super.init()
        let context = Preset.Context()
        let vc = Preset_VC(viewModel: Preset_VM(context: context))
        controller.manageChild(with: vc, nc: nc)
        
        context.showPresetInfo
            .map{ ($0, nc ?? vc) }
            .map(PresetDetailCoordinator.init)
            .subscribe()
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
}
