//
//  PresetDetailCoordinator.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 20/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

class PresetDetailCoordinator: AppCoordinator {
    init(with title: String, navigation: UINavigationController) {
        super.init()
        
        let context = PresetDetail.Context()
        let vc = PresetDetail_VC(viewModel: PresetDetail_VM(title: title,
                                                            context: context))
        vc.modalTransitionStyle = .flipHorizontal
        navigation.present(vc, animated: true, completion: nil)
        
        context.showAlert
            .map{ title in
                let alert = UIAlertController.buildBasicAlert(with: "Preset " + "\(title)",
                                                              message: "can be loaded!!")
                vc.present(alert, animated: true, completion: nil)
            }
            .subscribe()
            .disposed(by: disposeBag)
        
        context.dispose
            .map{ [self] in
                vc.dismiss(animated: true, completion: nil)
                disposeBag.dispose()
            }
            .subscribe()
            .disposed(by: disposeBag)
    }
}
