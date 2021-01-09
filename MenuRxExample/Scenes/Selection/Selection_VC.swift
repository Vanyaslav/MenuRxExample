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
    private
    lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .init(white: 0.7, alpha: 0.5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        // Rx Binding
        button.rx.tap
            .bind(to: viewModel.itemPressed)
            .disposed(by: disposeBag)
        
        viewModel.currentItem
            .map{ $0.title }
            .drive(button.rx.title(for: .normal))
            .disposed(by: disposeBag)
        
        return button
    }()
    
    private
    let disposeBag = DisposeBag()
    private
    let viewModel: Selection_VM
    
    init(with viewModel: Selection_VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        rx.viewDidLoad
            .bind(to: viewModel.didLoad)
            .disposed(by: disposeBag)
        
        viewModel.currentItem
            .map{ $0.backgroundColor }
            .drive(view.rx.backgroundColor)
            .disposed(by: disposeBag)
    }
    
    override func loadView() {
        super.loadView()
        
        modalPresentationStyle = .overCurrentContext
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor
                .constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor
                .constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
