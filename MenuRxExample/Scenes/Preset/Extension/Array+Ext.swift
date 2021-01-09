//
//  Array+Ext.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/11/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import Foundation

extension Preset {
    static
    let dataStringSeparator: String = ";"
}

extension Array where Element == String {
    func parsePresets() -> [Preset_VM.PresetItem] {
        return map{ $0.components(separatedBy: Preset.dataStringSeparator) }
            .map{ Preset_VM.PresetItem(with: $0[0], date: $0[1]) }
    }
    
    func concatPresetData() -> String {
        return compactMap{ $0 }
            .filter{ !$0.isEmpty }
            .joined(separator: Preset.dataStringSeparator)
    }
}
