//
//  UILabel+Ext.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 09/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

extension UILabel {
    static
    func loadBasic() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
