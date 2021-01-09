//
//  Preset_VM+PresetItem.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 09/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import Differentiator

extension Preset_VM {
    typealias SectionModel = Differentiator.SectionModel<Preset.TypeEnum, PresetItem>
}

extension Preset_VM {
    struct PresetItem {
        let title: String
        let date: String
        
        init(with title: String, date: String? = nil) {
            self.title = title
            self.date = date ?? Date().asString(style: .medium)
        }
    }
}
