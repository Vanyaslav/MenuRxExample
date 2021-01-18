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
    private lazy
    var menuView: UIStackView = {
        let sv = UIStackView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.distribution = .fillEqually
            sv.axis = .vertical
            sv.spacing = 2
        
        let items = Menu.ItemEnum.controlItems
            items.forEach(sv.addArrangedSubview)
        
        func makeMutuallyExclusive(with selection: Int) {
            items.map{ $0.tag == selection }
                .enumerated()
                .forEach{ items[$0.offset].isSelected = $0.element }
        }
        // manage selection
        viewModel.selectedItem
            .map(makeMutuallyExclusive)
            .drive()
            .disposed(by: disposeBag)
        // binding
        Observable
            .from(items)
            .selectedTag()
            .bind(to: viewModel.itemPressed)
            .disposed(by: disposeBag)
        
        return sv
    }()
    
    private
    let disposeBag = DisposeBag()
    private
    let viewModel: Menu_VM
    
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
        self.view.backgroundColor = .systemGray
        
        self.view.addSubview(menuView)
        menuView.fitScreen(with: view)
    }
}
