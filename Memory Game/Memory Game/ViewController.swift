//
//  ViewController.swift
//  Memory Game
//
//  Created by Mohamed on 4/13/17.
//  Copyright © 2017 geekFactory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreValueLabel: UILabel!
    
    @IBOutlet var memoryButtons: [UIButton]!
    
    
    var memoryArray = ["A","D","F","B","C","H","A","D","G","E","B","F","E","G","C","H"]
    var memoryVlues = [String]()
    var memoryTile_ids = [Int]()
    var tilesFlipped = 0
    var scourValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    
    
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print(sender.tag)
        
        memoryFlipTiltle(sender)
        
    }
    

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController{


    func memoryFlipTiltle(_ button : UIButton){
        if memoryVlues.count < 2 {
        
            if memoryVlues.count == 0 {
                memoryVlues.append(memoryArray[button.tag])
                memoryTile_ids.append(button.tag)
                memoryButtons[button.tag].setTitle(memoryArray[button.tag], for: .normal)
                
                
            }else if memoryVlues.count == 1 {
                memoryVlues.append(memoryArray[button.tag])
                memoryTile_ids.append(button.tag)
                memoryButtons[button.tag].setTitle(memoryArray[button.tag], for: .normal)
                if memoryVlues[0] == memoryVlues[1]{
                    tilesFlipped += 2
                    scourValue += 1
                    scoreValueLabel.text = "\(scourValue)"
                    memoryVlues.removeAll()
                    memoryTile_ids.removeAll()
                    if tilesFlipped == memoryArray.count {
                        let alert = UIAlertController(title: "Happy", message: "You have finnished the game", preferredStyle: .alert)
                        
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(action)
                        present(alert, animated: true, completion: nil)
                    }
                }else{
                 let   _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                       

                    self.memoryButtons[self.memoryTile_ids[0]].setTitle(nil, for: .normal)
                    self.memoryButtons[self.memoryTile_ids[1]].setTitle(nil, for: .normal)
                    
                    self.memoryVlues.removeAll()
                    self.memoryTile_ids.removeAll()
                    }
                
                }
                
                
            
            
            
            
            }
        
        
        
        
        
        
        }
        
        
        
        
        
        
        
        
        
        
    }
    
        
        
        
        
        
    }















