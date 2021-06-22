//
//  Preset_VM.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 31/10/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift
import RxCocoa

class Preset_VM {
    // in
    let didLoad = PublishSubject<Void>()
    let didClose = PublishSubject<Void>()
    
    let showAlert = PublishSubject<Void>()
    let modelPressed = PublishSubject<PresetItem>()
    let modelDeleted = PublishSubject<PresetItem>()
    /// out
    let loadTable: Driver<[SectionModel]>
    let isEditingAllowed: Driver<Bool>
    
    private let disposeBag = DisposeBag()
    
    init(context: Preset.Context,
         service: StorageService = StorageService()) {
        let reloadData = PublishSubject<Void>()
        
        let userPresetModels = Observable
            .merge(didLoad, reloadData)
            .flatMap(service.readPresets)
            .map{ SectionModel(model: .user, items: $0) }
        
        let factoryPresetModels = Observable
            .of(SectionModel(model: .factory,
                             items: Preset.factoryItems.parsePresets()))
        
        loadTable = Observable
            .combineLatest(factoryPresetModels,
                           userPresetModels)
            .map{ [$0, $1] }
            .asDriver()
        
        isEditingAllowed = userPresetModels
            .filter{ $0.model == .user }
            .map{ !$0.items.isEmpty }
            .asDriver()
        
        showAlert
            .bind(to: context.showCreatePresetAlert)
            .disposed(by: disposeBag)
        
        context.storePreset
            .map(service.update)
            .bind(to: reloadData)
            .disposed(by: disposeBag)
        
        modelPressed
            .map{ $0.title }
            .bind(to: context.showPresetInfo)
            .disposed(by: disposeBag)
        
        modelDeleted
            .map(service.delete)
            .bind(to: reloadData)
            .disposed(by: disposeBag)
        
        didClose
            .bind(to: context.dispose)
            .disposed(by: disposeBag)
    }
}
