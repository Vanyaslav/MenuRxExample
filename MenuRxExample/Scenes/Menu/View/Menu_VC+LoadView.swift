//
//  Menu_VC+LoadView.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 09/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

extension Menu_VC {
    override func loadView() {
        super.loadView()
        
        self.view.addSubview(menuView)
        self.view.backgroundColor = .systemGray
        
        let offset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            menuView.topAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                            constant: offset),
            menuView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                            constant: -offset),
            menuView.leftAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                            constant: offset),
            menuView.rightAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                            constant: -offset)
        ])
    }
}
