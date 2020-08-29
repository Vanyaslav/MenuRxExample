//
//  Menu_VM.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift

class Menu_VM {
    // in
    let itemPressed = PublishSubject<Int>()
    
    private let disposeBag = DisposeBag()
    
    init(context: Menu.Context) {
        itemPressed
            .map{ Menu.Item(rawValue: $0)!}
            .bind(to: context.itemSelected)
            .disposed(by: disposeBag)
    }
}
