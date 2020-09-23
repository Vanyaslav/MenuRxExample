//
//  ViewController.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 04/06/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class Menu_VC: UIViewController {
    private lazy var menuView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 2
        //
        let items = Menu.ItemEnum.allCases
            .map{ MenuItemButton(text: $0.title, tag: $0.rawValue) }
        
        items.forEach(sv.addArrangedSubview)
        
        viewModel.selectedItem
            .drive(onNext: {
                items.forEach{ $0.isSelected = false }
                items[$0].isSelected = true })
            .disposed(by: disposeBag)
        
        Observable
            .from(sv.arrangedSubviews.filter{ $0 is MenuItemButton })
            .map{ $0 as! MenuItemButton }
            .selectedTag()
            .bind(to: viewModel.itemPressed)
            .disposed(by: disposeBag)
        
        return sv
    }()
    
    private let disposeBag = DisposeBag()
    private let viewModel: Menu_VM
    
    init(viewModel: Menu_VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.view.addSubview(menuView)
        self.view.backgroundColor = .systemGray
        
        NSLayoutConstraint.activate([
            menuView.topAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                            constant: 10),
            menuView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                            constant: -10),
            menuView.leftAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                            constant: 10),
            menuView.rightAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                            constant: -10)
        ])
        //
        rx.viewWillAppear
            .take(1)
            .map{ _ in }
            .bind(to: viewModel.didLoad)
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
