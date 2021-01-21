//
//  Info_VC.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 10/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import UIKit

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
    
    init() {
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
