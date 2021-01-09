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

class Preset_VC: UIViewController {
    lazy
    var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        // tv.rowHeight = 54
        tv.allowsSelection = true
        
        tv.register(PresetsCell.self,
                    forCellReuseIdentifier: PresetsCell.identifier)
        
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
            guard let cell = tableView
                    .dequeueReusableCell(withIdentifier: PresetsCell.identifier) as? PresetsCell
            else { return UITableViewCell() }
            cell.set(item: item)
            return cell
        })
        
//        dataSource.titleForHeaderInSection = { dataSource, section in
//            dataSource.sectionModels[section].identity.title
//        }
              
        dataSource.canEditRowAtIndexPath = { dataSource, indexPath in
            Preset.TypeEnum(rawValue: indexPath.section) == .user
        }

        viewModel.loadTable
            .drive(tv.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        return tv
    }()
    
    lazy
    var addPresetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.rx.tap
            .bind(to: viewModel.showAlert)
            .disposed(by: disposeBag)
        
        return button
    }()
    
    private
    let disposeBag = DisposeBag()
    private
    let viewModel: Preset_VM
    
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
        super.setEditing(editing, animated: animated)
        tableView.setEditing((editing && !tableView.isEditing), animated: true)
    }
}
