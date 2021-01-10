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
        tableView.fitScreen(with: view)
    }
}
