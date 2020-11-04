//
//  PresetCoordinator+Alerts.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/11/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit

// Alerts
extension PresetCoordinator {
    func showPresetAlert(with name: String, vc: UIViewController) {
        let alert = UIAlertController(title: "Preset " + "\(name)",
                                      message: "can be loaded!!",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))
        
        vc.present(alert, animated: true, completion: nil)
    }
    //
    func showCreatePresetAlert(with context: Preset.Context, vc: UIViewController) {
        let alert = UIAlertController(title: nil,
                                      message: "Create a new preset:",
                                      preferredStyle: .alert)
        alert.addTextField()
        let textField = alert.textFields![0]
        
        alert.addAction(UIAlertAction(title: "Save",
                                      style: .default,
                                      handler: { [weak self] _ in
                                        guard let title = textField.text, title.count > 2
                                        else {
                                            self?.showCreatePresetAlert(with: context, vc: vc)
                                            return
                                        }
                                        context.storePreset.onNext(title)
                                      })
                        )
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))
        
        vc.present(alert, animated: true, completion: nil)
    }
}
