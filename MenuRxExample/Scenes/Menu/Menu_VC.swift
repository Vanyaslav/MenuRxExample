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
        // data
        let items = Menu.ItemEnum.allCases
            .map{ MenuItemButton(text: $0.title,
                                 tag: $0.rawValue) }
        items.forEach(sv.addArrangedSubview)
        // behaviour
        func makeMutuallyExclusive(with selection: Int) {
            items
                .map{ $0.tag == selection }
                .enumerated()
                .forEach{ items[$0.offset].isSelected = $0.element }
        }
        // action
        viewModel.selectedItem
            .map(makeMutuallyExclusive)
            .drive()
            .disposed(by: disposeBag)
        
        Observable
            .from(items)
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
        //
        rx.viewDidLoad
            .bind(to: viewModel.didLoad)
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
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
    }
}
