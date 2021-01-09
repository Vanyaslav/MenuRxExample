//
//  PresetsCell.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 31/10/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit

extension PresetsCell {
    static
    let identifier: String = "PresetsCell"
}

class PresetsCell: UITableViewCell {
    private lazy
    var titleLabel = UILabel.loadBasic()
    
    private lazy
    var dateLabel = UILabel.loadBasic()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [titleLabel, dateLabel].forEach(addSubview)
        
        let offset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor
                .constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                            constant: offset),
            titleLabel.centerYAnchor
                .constraint(equalTo: centerYAnchor),
            
            dateLabel.trailingAnchor
                .constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                            constant: -offset),
            dateLabel.centerYAnchor
                .constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(item: Preset_VM.PresetItem) {
        titleLabel.text = item.title
        dateLabel.text = item.date
    }
}
