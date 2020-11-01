//
//  Table_VC.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 31/10/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import ReusableKit

extension Table_VC {
    struct Cells {
        static let presetCell = ReusableCell<PresetsCell>(nibName: "PresetsCell")
        static func register(in tableView: UITableView) {
            tableView.register(presetCell)
        }
    }
}
extension Table_VC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UITableViewHeaderFooterView()
        view.textLabel?.text = Table_VM.SectionModel.Identity.allCases[section].title
        return view
    }
}

class Table_VC: UIViewController {
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.sectionHeaderHeight = 30.0
        tv.allowsSelection = true
        
        Cells.register(in: tv)
        
        tv.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        tv.rx
            .modelPressed(Table_VM.PresetItem.self)
            .bind(to: viewModel.modelPressed)
            .disposed(by: disposeBag)
        
        tv.rx
            .modelDeleted(Table_VM.PresetItem.self)
            .bind(to: viewModel.modelDeleted)
            .disposed(by: disposeBag)
               
        let dataSource = RxTableViewSectionedReloadDataSource<Table_VM.SectionModel>(configureCell:
        { _, tableView, indexPath, item in
            let cell = tableView.dequeue(Cells.presetCell, for: indexPath)
            cell.set(item: item)
            return cell
        })
              
        dataSource.canEditRowAtIndexPath = { dataSource, indexPath in
            PresetEnum(rawValue: indexPath.section) == .user
        }

        viewModel.sections
            .drive(tv.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        return tv
    }()
    
    private let disposeBag = DisposeBag()
    private let viewModel: Table_VM
    
    init(viewModel: Table_VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                            constant: 45),
            tableView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}
