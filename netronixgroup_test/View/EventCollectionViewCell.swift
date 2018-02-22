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

    func configureCell(item: Event) {
        self.labelName.text = item.name
        var measurementsString = ""
        for itemMeasurement in item.measurements {
            for measurement in itemMeasurement {
                measurementsString.append(measurement.measurementValue.joined(separator: ","))
            }
            measurementsString.append("\n")
        }
        self.labelMeasurements.text = measurementsString
        self.labelUnit.text = item.unit
    }
}
