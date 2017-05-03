//
//  ViewController.swift
//  CheckLists
//
//  Created by Mohamed on 4/17/17.
//  Copyright © 2017 GeekFactory. All rights reserved.
//

import UIKit
let nav  = UINavigationController()

class CheckListViewController: UITableViewController , AddItemTableViewControllerDelegatge{
    
    var items  : [checkListItem]
    var checklist:CategriesListModel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = checklist.categryName

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        items = []
        items = [checkListItem]()
               
        super.init(coder: aDecoder)
    }
    
    
    func addItem(item : checkListItem) {
        let newRowIndex = items.count
         checklist.itemsArray.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.itemsArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chrcklistitemIddentifer") as! ChecKlistCellTableViewCell
        
        configureCheckText(for: cell, at: indexPath)
        configureCheckmark(for: cell, at: indexPath)
        
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        checklist.itemsArray[indexPath.row].toggeld()
        let cell = tableView.cellForRow(at: indexPath) as! ChecKlistCellTableViewCell
        
        configureCheckmark(for: cell, at: indexPath)
        
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        checklist.itemsArray.remove(at: indexPath.row)
        DataManager.defaultManager.saveCategories()
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    
    
    
    
    func configureCheckmark(for cell : ChecKlistCellTableViewCell , at indexPath : IndexPath)  {
        let item = checklist.itemsArray[indexPath.row]
        cell.CheckMarklabel.text = item.checked ? "✔️" : ""
        
        
    }
    func configureCheckText(for cell : ChecKlistCellTableViewCell , at indexPath : IndexPath)  {
        let item = checklist.itemsArray[indexPath.row]
        cell.label.text = item.text
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "id"{
            
            if let navigation = segue.destination as? UINavigationController{
                if let  controller = navigation.topViewController! as?  AddTableViewController {
                    controller.delegate = self
                    
                }
            }
        }else if segue.identifier == "edit"{
        
            if let navigation = segue.destination as? UINavigationController{
                if let  controller = navigation.topViewController! as?  AddTableViewController {
                    controller.delegate = self
                    if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                    controller.itemToEdit = checklist.itemsArray[indexPath.row]
                        
                    
                    }
                    
                    
                    
                }
            }

        }
    }
    
    
    func addItemViewControllerDidCancel(_ controller: AddTableViewController) {
        
        
        self.dismiss(animated: true, completion: nil)
    }
    func additemViewController(_ controller: AddTableViewController, didFinishAdding item: checkListItem) {
        self.dismiss(animated: true, completion: nil)
        
        controller.dismiss(animated: true, completion: nil)
        let newRowIndex = checklist.itemsArray.count
        self.checklist.itemsArray.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        DataManager.defaultManager.saveCategories()

        
        
        
    }
    func addItemViewController(_ controller: AddTableViewController, didFinishEditig item: checkListItem) {
        
        let newIndex = checklist.itemsArray.index(of: item)!
        let indexPath = IndexPath(row: newIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.reloadRows(at: indexPaths, with: .automatic)
        DataManager.defaultManager.saveCategories()

        self.dismiss(animated: true, completion: nil)

        
        
        
    }
    
    
    
}

