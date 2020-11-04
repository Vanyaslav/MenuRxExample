//
//  Preset.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/11/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift

enum PresetEnum: Int, CaseIterable {
    case factory, user
    
    var identity: Int { return rawValue }
    
    var title: String {
        switch self {
        case .factory:
            return "Factory"
        case .user:
            return "User"
        }
    }
}

class Preset {
    class Context {
        // out
        let showCreateAlert = PublishSubject<Void>()
        let showPresetAlert = PublishSubject<String>()
        let dispose = PublishSubject<Void>()
        // in
        let storePreset = PublishSubject<String>()
    }
}
