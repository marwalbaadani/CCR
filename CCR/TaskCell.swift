//
//  TaskCell.swift
//  CCR
//
//  Created by Erica Millado on 2/27/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
