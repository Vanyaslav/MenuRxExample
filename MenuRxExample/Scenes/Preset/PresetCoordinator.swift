//
//  PresetCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 03/11/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift

protocol DetailCoordinatorProtocol {
    init(splitView: UISplitViewController)
}

class PresetCoordinator: DetailCoordinatorProtocol {
    private
    let disposeBag = CompositeDisposable()
    
    required
    init(splitView: UISplitViewController) {
        let context = Preset.Context()
        let presetsView = Preset_VC(viewModel: Preset_VM(context: context))
        let nc = UINavigationController(rootViewController: presetsView)
        splitView.showDetailViewController(nc, sender: nil)
        
        context.showPresetInfoAlert
            .map(presetsView.showPresetAlert)
            .subscribe()
            .disposed(by: disposeBag)
        
        context.showCreatePresetAlert
            .map{ context }
            .map(presetsView.showCreatePresetAlert)
            .subscribe()
            .disposed(by: disposeBag)
        
        context.dispose
            .map{ [self] in disposeBag.dispose() }
            .subscribe()
            .disposed(by: disposeBag)
    }
}