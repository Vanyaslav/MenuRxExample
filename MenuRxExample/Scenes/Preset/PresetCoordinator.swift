//
//  PresetCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 03/11/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift


class PresetCoordinator {
    private let disposeBag = CompositeDisposable()
    private let splitView: UISplitViewController
    
    init(splitView: UISplitViewController) {
        self.splitView = splitView
    }
    
    func start() {
        let context = Preset.Context()
        let presetsView = Preset_VC(viewModel: Preset_VM(context: context))
        let nc = UINavigationController(rootViewController: presetsView)
        splitView.showDetailViewController(nc, sender: nil)
        
        context.showPresetAlert
            .map{ ($0, presetsView) }
            .subscribeNext(weak: self, PresetCoordinator.showPresetAlert)
            .disposed(by: disposeBag)
        
        context.showCreateAlert
            .map{ (context, presetsView) }
            .subscribeNext(weak: self, PresetCoordinator.showCreatePresetAlert)
            .disposed(by: disposeBag)
        
        context.dispose
            .map{ [self] in disposeBag.dispose() }
            .subscribe()
            .disposed(by: disposeBag)
    }
}
