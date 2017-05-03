//
//  checkListItem.swift
//  CheckLists
//
//  Created by Mohamed on 4/19/17.
//  Copyright © 2017 GeekFactory. All rights reserved.
//
import Foundation


class checkListItem : NSObject , NSCoding {
    var text = ""
    var checked = false
    func toggeld (){
    checked = !checked
    
    }
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    
}

class CategriesListModel: NSObject , NSCoding {
    var categryName = ""
    var categryImage = ""
    var itemsArray = [checkListItem]()

    
    
    override init() {
        self.categryName = ""
        self.itemsArray = [checkListItem]()
        self.categryImage = ""
        
    }
    init(name: String, items: [checkListItem], iconName: String) {
        self.categryName = name
        self.itemsArray = items
        self.categryImage = iconName
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        categryName = aDecoder.decodeObject(forKey: "Name") as! String
        itemsArray = aDecoder.decodeObject(forKey: "Items") as! [checkListItem]
        categryImage = aDecoder.decodeObject(forKey: "IconName") as! String
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(categryName, forKey: "Name")
        aCoder.encode(itemsArray, forKey: "Items")
        aCoder.encode(categryImage
            , forKey: "IconName")
    }

    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in itemsArray where !item.checked {
            count += 1
        }
        return count
    }
    
    
    
}

