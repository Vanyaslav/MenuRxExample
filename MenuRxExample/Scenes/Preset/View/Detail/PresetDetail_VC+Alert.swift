//
//  PresetDetail_VC+Alert.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 18/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

extension PresetDetail_VC {
    func showPresetAlert(with name: String) {
        let alert = UIAlertController(title: "Preset " + "\(name)",
                                      message: "can be loaded!!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
