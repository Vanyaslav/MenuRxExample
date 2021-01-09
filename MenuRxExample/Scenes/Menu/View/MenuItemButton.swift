//
//  MenuItemButton.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 29/08/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit

class MenuItemButton: UIButton {
    init(text: String, tag: Int) {
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.tag = tag
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected
                ? .systemTeal
                : .black
            
            setTitleColor(isSelected
                ? .black
                : .white, for: .normal)
        }
    }
}
