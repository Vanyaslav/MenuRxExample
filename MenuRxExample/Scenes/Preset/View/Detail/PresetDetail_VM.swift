//
//  PresetDetail_VM.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 18/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import RxSwift
import RxCocoa

class PresetDetail_VM {
    // in
    let viewDidLoad = PublishSubject<Void>()
    let presentAlert = PublishSubject<Void>()
    let viewClosed = PublishSubject<Void>()
    // out
    let presetTitle: Driver<String>
    
    private
    let disposeBag = DisposeBag()
    
    init(title: String, context: PresetDetail.Context) {
        presetTitle = viewDidLoad
            .mapTo(title)
            .asDriver()
        
        presentAlert
            .map{ title }
            .bind(to: context.showAlert)
            .disposed(by: disposeBag)
        
        viewClosed
            .bind(to: context.dispose)
            .disposed(by: disposeBag)
    }
}
