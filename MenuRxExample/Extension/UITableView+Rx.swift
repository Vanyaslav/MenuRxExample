//
//  UITableView+Rx.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 31/10/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift

extension Reactive where Base: UITableView {
    public func modelPressed<T>(_ modelType: T.Type) -> Observable<T> {
        return modelSelected(modelType).asObservable()
    }
}
