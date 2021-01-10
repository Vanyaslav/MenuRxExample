//
//  StorageService.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 03/11/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift

class StorageService {
    @LocalStorage("userPresets", defaultValue: [])
    private var userPresets: [String]
}

// user presets
extension StorageService {
    func update(with presetName: String) {
        let item = [presetName, Date().asString(style: .medium)].concatPresetData()
        userPresets.append(item)
    }
    
    func delete(preset: Preset_VM.PresetItem) {
        let item = [preset.title, preset.date].concatPresetData()
        guard let index = userPresets.firstIndex(of: item) else { return }
        userPresets.remove(at: index)
    }
}

// Rx
extension StorageService {
    func readPresets() -> Observable<[Preset_VM.PresetItem]> {
        return Observable
            .from(optional: userPresets)
            .map{ $0.parsePresets() }
            .asObservable()
    }
}
