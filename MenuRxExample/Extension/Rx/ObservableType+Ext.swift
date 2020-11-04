//
//  ObservableType+Ext.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/11/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift

extension ObservableType {
    public func subscribeNext<A: AnyObject>(weak obj: A, _ onNext: @escaping (A) -> () -> Void) -> Disposable {
        return self.subscribe(onNext: { [weak obj] _ in
            guard let obj = obj else { return }
            onNext(obj)()
        })
    }

    public func subscribeNext<A: AnyObject, B, C>(weak obj: A, _ onNext: @escaping (A) -> ((B, C) -> Void)) -> Disposable where Element == (B, C) {
        return self.subscribe(onNext: { [weak obj] input in
            guard let obj = obj else { return }
            onNext(obj)(input.0, input.1)
        })
    }
}
