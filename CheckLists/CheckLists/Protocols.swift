//
//  Protocols.swift
//  CheckLists
//
//  Created by Mohamed on 5/1/17.
//  Copyright © 2017 GeekFactory. All rights reserved.
//


protocol AddCategoryTableViewControllerDelegatge : class {
    
    func addCategoryViewControllerDidCancel(_ controller : addCategoryTableViewController)
    
    func addCategoryViewController(_ controller : addCategoryTableViewController , didFinishAdding item : CategriesListModel)
    
    func addCategoryViewController(_ controller : addCategoryTableViewController , didFinishEditig item : CategriesListModel)
    
}
protocol AddItemTableViewControllerDelegatge : class {
    
    func addItemViewControllerDidCancel(_ controller : AddTableViewController)
    func additemViewController(_ controller : AddTableViewController , didFinishAdding item : checkListItem)
    func addItemViewController(_ controller : AddTableViewController , didFinishEditig item : checkListItem)
    
}

protocol SelectIconDelegate: class {
    
    func selectImage(_ picker: SelectIconTableViewController, didPickIcon Icon: String)
}
