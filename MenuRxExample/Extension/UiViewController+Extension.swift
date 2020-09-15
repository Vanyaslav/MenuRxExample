//
//  UiViewController+Extension.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 14/09/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftExt

extension Reactive where Base: UIViewController {
    var viewDidLoad: Observable<Void> {
        return base.rx.methodInvoked(#selector(Base.viewDidLoad)).mapTo(Void())
    }
    
    var viewWillAppear: Observable<Bool> {
        return base.rx.sentMessage(#selector(Base.viewWillAppear(_:))).map { $0[0] as! Bool }
    }

    var viewDidAppear: Observable<Bool> {
        return base.rx.methodInvoked(#selector(Base.viewDidAppear(_:))).map { $0[0] as! Bool }
    }
}
