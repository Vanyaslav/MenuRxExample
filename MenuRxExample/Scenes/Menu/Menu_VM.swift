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
    // out
    let  selectedItem: Driver<Int>
    
    private let disposeBag = DisposeBag()
    
    init(context: Menu.Context) {
        itemPressed
            .map{ Menu.ItemEnum(rawValue: $0) }
            .unwrap()
            .bind(to: context.itemSelected)
            .disposed(by: disposeBag)
        
        selectedItem = itemPressed.asDriver()
    }
}
