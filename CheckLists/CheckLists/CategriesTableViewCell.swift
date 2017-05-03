//
//  CategriesTableViewCell.swift
//  CheckLists
//
//  Created by Mohamed on 4/28/17.
//  Copyright © 2017 GeekFactory. All rights reserved.
//

import UIKit

class CategriesTableViewCell: UITableViewCell {

    @IBOutlet weak var CategryLabel: UILabel!
    @IBOutlet weak var CategryIcon: UIImageView!
       @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
