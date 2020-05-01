//
//  ViewController.swift
//  Program 10
//
//  Created by Jake McCormick on 5/1/20.
//  Copyright © 2020 Jake McCormick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var favoriteFood: UITextField!
    @IBOutlet weak var results: UITextView?
    
    
    
    
    
    
    
    @IBAction func saveresults(_ sender: Any) {
         let csvLine:String = "\(firstName.text!),\(lastName.text!),\(favoriteFood.text!)\n"
               
               let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
               let docDir:String=paths[0]
               let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
                                                                   
               
               
               
             
               if !FileManager.default.fileExists(atPath: resultsFile) {
                   FileManager.default.createFile(atPath: resultsFile,contents: nil, attributes: nil)
               }
               
               let fileHandle:FileHandle=FileHandle(forUpdatingAtPath:resultsFile)!
               fileHandle.seekToEndOfFile()
               fileHandle.write(csvLine.data(using: String.Encoding.utf8)!)
               fileHandle.closeFile()
               
               firstName.text = ""
               lastName.text = ""
               favoriteFood.text = ""
    }

    @IBAction func displayResults(_ sender: Any) {
         let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
         let docDir:String=paths[0] as String
               
         let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
               
               
               
               
         if FileManager.default.fileExists(atPath: resultsFile) {
         let fileHandle:FileHandle = FileHandle(forReadingAtPath:resultsFile)!
         let resultsData:String!=NSString(data: fileHandle.availableData, encoding: String.Encoding.utf8.rawValue)! as String
                   fileHandle.closeFile()
                   
                   
                   results?.text=resultsData
               }
               else
               {
                 
               }
               
    }
    

    
        
        
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

