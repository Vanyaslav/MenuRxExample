//
//  UIAlertController+Ext.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 20/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

extension UIAlertController {
    static
    func buildBasicAlert(with title: String? = nil,
                         message: String? = nil,
                         disposeAction: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: disposeAction))
        return alert
    }
}
