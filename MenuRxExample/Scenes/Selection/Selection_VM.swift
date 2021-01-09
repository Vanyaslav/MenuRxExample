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
    // in
    let didLoad = PublishSubject<Void>()
    let itemPressed = PublishSubject<Void>()
    // out
    let currentItem: Driver<Menu.ItemEnum>
    
    private
    let disposeBag = DisposeBag()
    
    init(with item: Menu.ItemEnum) {
        currentItem = didLoad
            .mapTo(item)
            .asDriver()
        
        itemPressed
            .subscribe(onNext: { _ in print("Item " + item.title + " pressed.")})
            .disposed(by: disposeBag)
    }
}
