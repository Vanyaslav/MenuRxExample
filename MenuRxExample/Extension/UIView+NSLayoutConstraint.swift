//
//  UIView+Ext.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 10/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

extension UIView {
    func fitScreen(with view: UIView, offset: CGFloat = 10) {
        NSLayoutConstraint.activate([
            topAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                            constant: offset),
            bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                            constant: -offset),
            leftAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                            constant: offset),
            rightAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                            constant: -offset)
        ])
    }
}
