//
//  CategriesTableViewController.swift
//  CheckLists
//
//  Created by Mohamed on 4/28/17.
//  Copyright © 2017 GeekFactory. All rights reserved.
//

import UIKit

class CategriesTableViewController: UITableViewController {
    var categries = [CategriesListModel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    
    
//    required init?(coder aDecoder: NSCoder) {
//        categries = []
//        categries = [CategriesListModel]()
//        super.init(coder: aDecoder)
//        
//        
//    }
    
    
    func addItem(item : CategriesListModel) {
        let newRowIndex = categries.count
        categries.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        
        
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.defaultManager.allCategories.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategryCellId") as! CategriesTableViewCell
        
        configureCategryCell(for: cell, at: indexPath)
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            DataManager.defaultManager.allCategories.remove(at: indexPath.row)
            DataManager.defaultManager.saveCategories()
            tableView.deleteRows(at: [indexPath], with: .automatic)

            
            
            
        }
    }
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "checkListItems" {
    //            let controller = segue.destination as! ChecklistViewController
    //            controller.checkList = sender as! Checklist
    
    //        } else if segue.identifier == "newCategory" {
    //            let navigationController = segue.destination as! UINavigationController
    //            let controller = navigationController.topViewController as! AddNewCheckListTableViewController
    //
    //            controller.delegate = self
    //            controller.checklistToEdit = nil
    //        }
    //    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "itemsData" {
            
            let controller = segue.destination as! CheckListViewController
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {

                controller.checklist = DataManager.defaultManager.allCategories[indexPath.row]
            }
            
        }else  if segue.identifier == "addNewCategryID"{
            
            if let navigation = segue.destination as? UINavigationController{
                if let  controller = navigation.topViewController! as?  addCategoryTableViewController {
                    controller.delegate = self
                    controller.itemToEdit = nil
                    
                }
            }
        }else{
            if let navigation = segue.destination as? UINavigationController{
                if let  controller = navigation.topViewController! as?  addCategoryTableViewController {
                    controller.delegate = self
                    if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                        controller.itemToEdit = DataManager.defaultManager.allCategories[indexPath.row]
                    }
                    
                }
            }
            
            
        }
    }
    
    
}

extension CategriesTableViewController{
    
    
    func configureCategryCell(for cell : CategriesTableViewCell , at indexPath : IndexPath)  {
        let item = DataManager.defaultManager.allCategories[indexPath.row]
        cell.CategryLabel.text = item.categryName
        cell.CategryIcon.image = UIImage(named: item.categryImage)
        let uncheckedItems = item.countUncheckedItems()
        print(uncheckedItems)
        if item.itemsArray.count == 0 {
            cell.detailLabel!.text = "No Items"
        }else {
            cell.detailLabel!.text = "\(uncheckedItems)"
        }
        
    }
    
}


extension CategriesTableViewController : AddCategoryTableViewControllerDelegatge{
    
    func addCategoryViewController(_ controller: addCategoryTableViewController, didFinishEditig item: CategriesListModel) {
        tableView.reloadData()

        DataManager.defaultManager.saveCategories()
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    func addCategoryViewControllerDidCancel(_ controller: addCategoryTableViewController) {
        tableView.reloadData()

        dismiss(animated: true, completion: nil)
    }
    
    func addCategoryViewController(_ controller: addCategoryTableViewController, didFinishAdding item: CategriesListModel) {
        DataManager.defaultManager.allCategories.append(item)
        DataManager.defaultManager.saveCategories()
        tableView.reloadData()
    }
    
    
    
}





















