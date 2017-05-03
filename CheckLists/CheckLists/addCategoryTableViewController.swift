//
//  addCategoryTableViewController.swift
//  CheckLists
//
//  Created by Mohamed on 4/28/17.
//  Copyright © 2017 GeekFactory. All rights reserved.
//

import UIKit

class addCategoryTableViewController: UITableViewController {
    
    
    var delegate : AddCategoryTableViewControllerDelegatge!
    var itemToEdit : CategriesListModel?
    var iconName = "No Icon"
    let checklist = CategriesListModel()

    
    @IBOutlet weak var CategoryNameTextField : UITextField!
    @IBOutlet weak var CategoryIcon : UIImageView!

    @IBOutlet weak var DoneBarBut : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryNameTextField.becomeFirstResponder()
        if let categoryToEdit = itemToEdit {
            title = "Edit Category"
            CategoryNameTextField.text = categoryToEdit.categryName
            DoneBarBut.isEnabled = true
            iconName = categoryToEdit.categryImage
        }
        
        CategoryIcon.image = UIImage(named: iconName)

    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func DoneBarBut (_ sender : UIBarButtonItem){
    
        if let checkList = itemToEdit {
            checkList.categryName = CategoryNameTextField.text!
            delegate.addCategoryViewController(self, didFinishEditig: checkList)
            
        
        }else{
            
            
        checklist.categryName = self.CategoryNameTextField.text!
        //        checklist.categryImage = self.iconName
        
        delegate?.addCategoryViewController(self, didFinishAdding: checklist)
    
    self.dismiss(animated: true, completion: nil)
    
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickImage" {
            let controller = segue.destination as! SelectIconTableViewController
            controller.delegate = self
        }
    }
    

    
    @IBAction func CancelBarBut (_ sender : UIBarButtonItem){
        delegate.addCategoryViewControllerDidCancel(self)

        
    }
   
}

extension addCategoryTableViewController : UITextFieldDelegate, SelectIconDelegate{



    func textFieldDidBeginEditing(_ textField: UITextField) {
//       
//        if textField.text == ""{
//        DoneBarBut.isEnabled = false
//            
//        }else{
        
            DoneBarBut.isEnabled = true

//        }
    }



    
    func selectImage(_ picker: SelectIconTableViewController, didPickIcon Icon: String) {
        if let checkList = itemToEdit {
            checkList.categryImage = Icon
        }else{
        checklist.categryImage = Icon
        }
        self.iconName = Icon
        
        CategoryIcon.image = UIImage(named: Icon)
        navigationController!.popViewController(animated: true)
    }






}
