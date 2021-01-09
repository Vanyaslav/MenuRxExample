//
//  Preset_VC+LoadView.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 09/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

extension Preset_VC {
    override func loadView() {
        super.loadView()
        
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.titleView = addPresetButton
        
        view.addSubview(tableView)
        
        let offset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            tableView.topAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                            constant: offset),
            tableView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                            constant: -offset),
            tableView.leftAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                            constant: offset),
            tableView.rightAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                            constant: -offset)
        ])
    }
}
