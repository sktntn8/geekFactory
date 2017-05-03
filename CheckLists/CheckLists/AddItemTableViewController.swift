//
//  AddTableViewController.swift
//  CheckLists
//
//  Created by Mohamed on 4/22/17.
//  Copyright © 2017 GeekFactory. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController {
    var delegate : AddItemTableViewControllerDelegatge!
    var categoryToEdit : CategriesListModel?

    @IBOutlet weak var textF : UITextField!
    
    var itemToEdit :checkListItem?
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
            textF.text = item.text
        }
        textF.becomeFirstResponder()
    }
    
    @IBAction func cancelBarBut(_ sender: UIBarButtonItem) {
        delegate.addItemViewControllerDidCancel(self)

    }
    
    
    @IBAction func DoneNavBut(_ sender: UIBarButtonItem) {
        
        if let item = itemToEdit {
            
            item.text = textF.text!
            delegate?.addItemViewController(self, didFinishEditig: item)
        } else {
            
            let item = checkListItem(text: self.textF.text!, checked: false)
        
            
            delegate?.additemViewController(self, didFinishAdding: item)
        }
        self.dismiss(animated: true, completion: nil)
    }
    

  }

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
}

