//
//  Selection_VM.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 29/08/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxCocoa
import RxSwift

class Selection_VM {
    let initialItem: Menu.Item
    
    let itemPressed = PublishSubject<Void>()
    
    private let disposeBag = DisposeBag()
    
    init(with item: Menu.Item) {
        initialItem = item
        
        itemPressed
            .subscribe(onNext: { _ in print(" Item " + item.title + " pressed.")})
            .disposed(by: disposeBag)
    }
    
}
