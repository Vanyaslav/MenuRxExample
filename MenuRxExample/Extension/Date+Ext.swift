//
//  Date+Ext.swift
//  BrainEqualizer
//
//  Created by Tomas Baculák on 06/08/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import Foundation

extension Date {
    func asString(style: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
  }
}
