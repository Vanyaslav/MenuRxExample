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
    func update(with newPreset: String) {
        userPresets.append(newPreset)
    }
    
    func delete(preset: String) {
        guard let index = userPresets.firstIndex(of: preset) else { return }
        userPresets.remove(at: index)
    }
}

// Rx
extension StorageService {
    func readPresets() -> Observable<[String]> {
        return Observable
            .from(optional: userPresets)
            .asObservable()
    }
}
