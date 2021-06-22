//
//  AppDelegate.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private let disposeBag = DisposeBag()
    private var appCoordinator: AppCoordinator? {
        didSet {
            #if DEBUG
            Observable<Int>
                .interval(.seconds(1), scheduler: MainScheduler.instance)
                .subscribe(onNext: { _ in print("Resource count \(RxSwift.Resources.total)") })
                .disposed(by: disposeBag)
            #endif
        }
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = MenuCoordinator(with: window!)
        return true
    }
}

