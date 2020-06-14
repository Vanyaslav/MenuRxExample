//
//  Selection_VC.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift

class Selection_VC: UIViewController {
    private let disposeBag = DisposeBag()
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle(self.item.title, for: .normal)
        button.backgroundColor = .init(white: 0.7, alpha: 0.5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.rx.tap
            .subscribe(onNext: { [unowned self] _ in print("Button \(self.item.title) pressed") })
            .disposed(by: disposeBag)
        return button
    }()
    
    private let item: Menu.Item
    
    init(with item: Menu.Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .overCurrentContext
        //
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        switch item {
            case .home:
                view.backgroundColor = .cyan
            case .select1:
                view.backgroundColor = .systemIndigo
            case .select2:
                view.backgroundColor = .orange
            case .select3:
                view.backgroundColor = .magenta
            case .info:
                view.backgroundColor = .black
           }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
