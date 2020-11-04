//
//  Preset_VC.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 31/10/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import ReusableKit


extension Preset_VC {
    struct Cells {
        static let presetCell = ReusableCell<PresetsCell>(nibName: "PresetsCell")
        static func register(in tableView: UITableView) {
            tableView.register(presetCell)
        }
    }
}

class Preset_VC: UIViewController {
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 54
        tv.allowsSelection = true
        
        Cells.register(in: tv)
        
        tv.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        tv.rx
            .modelSelected(Preset_VM.PresetItem.self)
            .bind(to: viewModel.modelPressed)
            .disposed(by: disposeBag)
        
        tv.rx
            .modelDeleted(Preset_VM.PresetItem.self)
            .bind(to: viewModel.modelDeleted)
            .disposed(by: disposeBag)
               
        let dataSource = RxTableViewSectionedReloadDataSource<Preset_VM.SectionModel>(configureCell:
        { _, tableView, indexPath, item in
            let cell = tableView.dequeue(Cells.presetCell, for: indexPath)
            cell.set(item: item)
            return cell
        })
        
//        dataSource.titleForHeaderInSection = { dataSource, section in
//            dataSource.sectionModels[section].identity.title
//        }
              
        dataSource.canEditRowAtIndexPath = { dataSource, indexPath in
            PresetEnum(rawValue: indexPath.section) == .user
        }

        viewModel.loadTable
            .drive(tv.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        return tv
    }()
    
    private lazy var addPresetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.rx.tap
            .bind(to: viewModel.showAlert)
            .disposed(by: disposeBag)
        
        return button
    }()
    
    private let disposeBag = DisposeBag()
    private let viewModel: Preset_VM
    
    init(viewModel: Preset_VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        rx.viewDidLoad
            .bind(to: viewModel.didLoad)
            .disposed(by: disposeBag)
        
        rx.viewDidDisappear
            .map{_ in }
            .bind(to: viewModel.didClose)
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        tableView.setEditing((editing && !tableView.isEditing), animated: true)
    }
    
    override func loadView() {
        super.loadView()
        
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.titleView = addPresetButton
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                            constant: 10),
            tableView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                            constant: -10),
            tableView.leftAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                            constant: 10),
            tableView.rightAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                            constant: -10)
        ])
    }
}
