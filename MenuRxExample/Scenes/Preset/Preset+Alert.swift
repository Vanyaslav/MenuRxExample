//
//  Preset+Alert.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 22/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

extension Preset {
    static
    func buildCreatePresetAlert(with context: Context) -> UIAlertController {
        let alert = UIAlertController.buildBasicAlert(with: nil,
                                      message: "Create a new preset:")
        alert.addTextField()
        let textField = alert.textFields![0]
        
        alert.addAction(UIAlertAction(title: "Save",
                                      style: .default,
                                      handler: { _ in
                                        guard let title = textField.text,
                                              title.count >= minimalPresetNameLength
                                        else {
                                            context.showCreatePresetAlert.onNext(())
                                            return
                                        }
                                        context.storePreset.onNext(title)
                                      }))
        return alert
    }
}
