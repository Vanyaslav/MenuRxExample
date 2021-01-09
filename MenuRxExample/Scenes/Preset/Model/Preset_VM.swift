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
    
    private
    let disposeBag = DisposeBag()
    
    init(context: Preset.Context,
         service: StorageService = StorageService()) {
        let reloadData = PublishSubject<Void>()
        
        let userPresetModels = Observable
            .merge(didLoad, reloadData)
            .flatMap(service.readPresets)
            .map{ $0.parsePresets() }
            .map{ SectionModel(model: .user, items: $0) }
        
        let factoryPresetModels = Observable
            .of(SectionModel(model: .factory,
                             items: Preset.factoryItems.parsePresets()))
        
        loadTable = Observable
            .combineLatest(factoryPresetModels,
                           userPresetModels)
            .map{ [$0, $1] }
            .asDriver()
        
        showAlert
            .bind(to: context.showCreatePresetAlert)
            .disposed(by: disposeBag)
        
        context.storePreset
            .map{ [$0, Date().asString(style: .medium)] }
            .map{ $0.concatPresetData() }
            .map(service.update)
            .bind(to: reloadData)
            .disposed(by: disposeBag)
        
        modelPressed
            .map{ $0.title }
            .bind(to: context.showPresetInfoAlert)
            .disposed(by: disposeBag)
        
        modelDeleted
            .map{ [$0.title, $0.date] }
            .map{ $0.concatPresetData() }
            .map(service.delete)
            .bind(to: reloadData)
            .disposed(by: disposeBag)
        
        didClose
            .bind(to: context.dispose)
            .disposed(by: disposeBag)
    }
}