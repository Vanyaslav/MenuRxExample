//
//  PresetsCell.swift
//  MenuRxExample
//
//  Created by Tomas Baculák on 31/10/2020.
//  Copyright © 2020 Tomas Baculák. All rights reserved.
//

import UIKit

class PresetsCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    func set(item: Preset_VM.PresetItem) {
        titleLabel.text = item.title
        dateLabel.text = item.date
    }
}
