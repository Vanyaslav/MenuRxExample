//
//  Table_VM.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 31/10/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift
import RxCocoa
import Differentiator

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

class Table_VM {
    // in
    let didLoad = PublishSubject<Void>()
    
    let modelPressed = PublishSubject<PresetItem>()
    let modelDeleted = PublishSubject<PresetItem>()
    /// out
    let sections: Driver<[SectionModel]>
    
    init () {
        sections = didLoad
            .map{ [SectionModel(model: .factory,
                                items: [PresetItem(title: "")])
            ]}
            .asDriver()
    }
    
}

extension Table_VM {
    typealias SectionModel = Differentiator
        .SectionModel<PresetEnum, PresetItem>
}

extension Table_VM {
    struct PresetItem {
        let title: String
        let date: String = Date().asString(style: .medium)
    }
}
