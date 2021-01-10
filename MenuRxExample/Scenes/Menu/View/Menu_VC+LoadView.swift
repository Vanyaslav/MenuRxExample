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
        menuView.fitScreen(with: view)
    }
}
