//
//  ChecKlistCellTableViewCell.swift
//  CheckLists
//
//  Created by Mohamed on 4/17/17.
//  Copyright © 2017 GeekFactory. All rights reserved.
//

import UIKit

class ChecKlistCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var CheckMarklabel: UILabel!


    var cellCheckItem : checkListItem!{
        didSet{
            label.text = cellCheckItem.text
        }
    }
    
    override func prepareForReuse() {
        label.text = ""
        
    }
    


}
