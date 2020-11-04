//
//  Disposable+Ext.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/11/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift

extension Disposable {
    @discardableResult
    public func disposed(by bag: CompositeDisposable) -> CompositeDisposable.DisposeKey? {
        return bag.insert(self)
    }

    public func asObservable() -> Observable<Void> {
        return .create { _ in
            return self
        }
    }
}
