//
//  EventCollectionViewCell.swift
//  netronixgroup_test
//
//  Created by Roman Resenchuk on 22/02/2018.
//  Copyright © 2018 Roman Resenchuk. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelMeasurements: UILabel!
    @IBOutlet weak var labelUnit: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
