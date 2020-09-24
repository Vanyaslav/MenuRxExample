//
//  Menu_VM.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift
import RxCocoa

class Menu_VM {
    // in
    let itemPressed = PublishSubject<Int>()
    let didLoad = PublishSubject<Void>()
    // out
    let selectedItem: Driver<Int>
    
    private let disposeBag = DisposeBag()
    
    init(context: Menu.Context,
         initialPage: Menu.ItemEnum = .defaultItem) {
        
        let action = Observable
            .merge(didLoad.map{ initialPage.rawValue },
                   itemPressed)
        action
            .map{ Menu.ItemEnum(rawValue: $0) }
            .unwrap()
            .bind(to: context.itemSelected)
            .disposed(by: disposeBag)
        
        selectedItem = action.asDriver()
    }
}
