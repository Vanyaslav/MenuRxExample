//
//  Observable+Extension.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import RxSwift
import RxCocoa

extension Observable {
    func asDriver() -> Driver<Element> {
        return asDriver(onErrorDriveWith: .empty())
    }
}
