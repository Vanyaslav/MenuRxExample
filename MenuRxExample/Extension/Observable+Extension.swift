//
//  Observable+Extension.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift

extension Observable where Element: UIButton {
    func mutualExclusiveSelection() -> Disposable {
        return scan(Disposables.create()) { disposable, button in
            let subscription = self.selectedButton()
                .map{ $0 == button }.debug("selected: ")
                .bind(to: button.rx.isSelected)
            return Disposables.create(disposable, subscription)
        }.subscribe()
    }
}

extension Observable where Element: UIButton {
    func selectedTag() -> Observable<Int> {
        return selectedButton().map{ $0.tag }
    }
    
    func selectedButton() -> Observable<UIButton> {
        return map{ button in button.rx.tap.map{ button }}.merge()
    }
}
