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
    private lazy var infoView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textAlignment = .center
        tv.font = .boldSystemFont(ofSize: 30)
        tv.text = "Examples of use: MVVM - C and FRP with RxSwift"
        return tv
    }()
    
    init(with item: Menu.ItemEnum?) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = item?.backgroundColor
        title = item?.title
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
