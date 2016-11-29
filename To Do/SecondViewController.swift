//
//  SecondViewController.swift
//  To Do
//
//  Created by Islam on 27/07/2016.
//  Copyright © 2016 Islam. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet var toDoItem: UITextField!
    
    @IBAction func addToDo(_ sender: AnyObject) {
        
        toDoTable.append(toDoItem.text!)
        
        toDoItem.text = ""
        
        UserDefaults.standard.set(toDoTable, forKey: "toDoTable")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Allow the user to tap outside the keyboar and close the keyboard down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {
        
        toDoItem.resignFirstResponder()
        
        return true
    }
    

}

