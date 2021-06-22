//
//  PresetDetail_VC.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 14/01/2021.
//  Copyright © 2021 Tomas Baculák. All rights reserved.
//

import RxSwift
import RxCocoa

class PresetDetail {
    class Context {
        let showAlert = PublishSubject<String>()
        let dispose = PublishSubject<Void>()
    }
}

class PresetDetail_VC: UIViewController {
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.rx.tap
            .bind(to: viewModel.closeView)
            .disposed(by: disposeBag)
        return button
    }()
    private lazy var infoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.red.withAlphaComponent(0.7)
        button.setTitle("Info", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.rx.tap
            .bind(to: viewModel.presentAlert)
            .disposed(by: disposeBag)
        return button
    }()
    private let disposeBag = DisposeBag()
    private let viewModel: PresetDetail_VM
    
    init(viewModel: PresetDetail_VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        rx.viewDidLoad
            .bind(to: viewModel.viewDidLoad)
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .darkGray
        
        [infoButton, closeButton]
            .forEach(view.addSubview)
        
        let offset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor
                .constraint(equalTo: view.leadingAnchor,
                            constant: offset),
            closeButton.topAnchor
                .constraint(equalTo: view.topAnchor,
                            constant: offset),
            
            infoButton.centerXAnchor
                .constraint(equalTo: view.centerXAnchor),
            infoButton.centerYAnchor
                .constraint(equalTo: view.centerYAnchor)
        ])
    }
}
