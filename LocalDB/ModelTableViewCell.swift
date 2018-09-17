//
//  ModelTableViewCell.swift
//  LocalDB
//
//  Created by veera reddy on 17/09/18.
//  Copyright © 2018 veera reddy. All rights reserved.
//

import UIKit

class ModelTableViewCell: UITableViewCell {
   @IBOutlet weak var address: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
