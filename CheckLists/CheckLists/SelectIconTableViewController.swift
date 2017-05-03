//
//  SelectIconTableViewController.swift
//  CheckLists
//
//  Created by Mohamed on 5/3/17.
//  Copyright © 2017 GeekFactory. All rights reserved.
//

import UIKit

class SelectIconTableViewController: UITableViewController {
    
    weak var delegate: SelectIconDelegate?
    
    let images = [
        "No Icon",
        "Appointments",
        "Birthdays",
        "Chores",
        "Drinks",
        "Folder",
        "Groceries",
        "Inbox",
        "Photos",
        "Trips"
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
        
        let iconName = images[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            let imageName = images[indexPath.row]
            
            delegate.selectImage(self,  didPickIcon: imageName)
        }
    }
}
