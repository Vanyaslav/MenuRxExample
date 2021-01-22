//
//  Info_VC.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 10/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Info_VC: UIViewController {
    private lazy
    var infoView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textAlignment = .center
        tv.font = .boldSystemFont(ofSize: 30)
        tv.text = "Examples of use: MVVM - C and FRP with RxSwift"
        return tv
    }()
    
    private
    let viewModel: Info_VM
    
    init(with viewModel: Info_VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(infoView)
        infoView.fitScreen(with: view)
    }
}

class Info_VM {
    // in
    let didLoad = PublishSubject<Void>()
    // out
    let viewTitle: Driver<String>
    let viewBackgroundColor: Driver<UIColor>
    
    private
    let disposeBag = DisposeBag()
    
    init(with item: Menu.ItemEnum?) {
        viewTitle = didLoad
            .map{ item?.title ?? "" }
            .asDriver()
        
        viewBackgroundColor = didLoad
            .map{ item?.backgroundColor ?? .darkGray }
            .asDriver()
    }
}
