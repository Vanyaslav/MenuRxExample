//
//  Table_VC+UITableViewDelegate.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 03/11/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import ReusableKit

extension Preset_VC: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let view = UITableViewHeaderFooterView()
        view.textLabel?.text = Preset_VM.SectionModel
            .Identity
            .allCases[section]
            .title
        return view
    }
    
    func tableView(_ tableView: UITableView,
                   willDisplayHeaderView view: UIView,
                   forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView,
              let textlabel = headerView.textLabel else { return }
        textlabel.textColor = .systemTeal
        textlabel.font = .boldSystemFont(ofSize: 26)
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}
