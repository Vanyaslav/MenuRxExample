//
//  PresetCoordinator+Alerts.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/11/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit

// Alerts
extension Preset_VC {    
    func showCreatePresetAlert(with context: Preset.Context) {
        let alert = UIAlertController(title: nil,
                                      message: "Create a new preset:",
                                      preferredStyle: .alert)
        alert.addTextField()
        let textField = alert.textFields![0]
        
        alert.addAction(UIAlertAction(title: "Save",
                                      style: .default,
                                      handler: { _ in
                                        guard let title = textField.text,
                                              title.count >= Preset.minimalPresetNameLength
                                        else {
                                            self.showCreatePresetAlert(with: context)
                                            return
                                        }
                                        context.storePreset.onNext(title)
                                      }))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
