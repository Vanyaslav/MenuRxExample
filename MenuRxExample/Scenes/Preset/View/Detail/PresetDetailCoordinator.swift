//
//  PresetDetailCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 20/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

class PresetDetailCoordinator: AppCoordinator {
    init(with title: String, navigation: UIViewController) {
        super.init()
        
        let context = PresetDetail.Context()
        let vc = PresetDetail_VC(viewModel: PresetDetail_VM(title: title,
                                                            context: context))
        vc.modalTransitionStyle = .flipHorizontal
        navigation.present(vc, animated: true, completion: nil)
        
        context.showAlert
            .map{ ("Preset " + $0, "can be loaded!!", nil) }
            .map(UIAlertController.buildBasicAlert)
            .map{ ($0, true, nil) }
            .map(vc.present)
            .subscribe()
            .disposed(by: disposeBag)
        
        context.dispose
            .map{
                vc.dismiss(animated: true, completion: nil)
                self.disposeBag.dispose()
            }
            .subscribe()
            .disposed(by: disposeBag)
    }
}
