//
//  FileManager.swift
//  CheckLists
//
//  Created by Mohamed on 4/28/17.
//  Copyright © 2017 GeekFactory. All rights reserved.
//
import Foundation

class DataManager{
    
    static var defaultManager = DataManager()
    
    var allCategories  = [CategriesListModel]()

    
    private init(){}
    
    private func dataDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return paths[0] as NSString
    }
    
    private func dataFilePath() -> String {
        return dataDirectory().appendingPathComponent("Checklists.plist")
    }
    
    
    func saveCategories() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(allCategories, forKey: "AllCategories")
        archiver.finishEncoding()
        data.write(toFile: dataFilePath(), atomically: true)
    }
    
    func loadAllCategories() {
        let path = dataFilePath()
        if FileManager.default.fileExists(atPath: path) {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
                self.allCategories = unarchiver.decodeObject(forKey: "AllCategories")
                    as! [CategriesListModel]
                unarchiver.finishDecoding()
            }
        }
    }

    
    
    
}
