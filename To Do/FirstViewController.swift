//
//  FirstViewController.swift
//  To Do
//
//  Created by Islam on 27/07/2016.
//  Copyright © 2016 Islam. All rights reserved.
//

import UIKit

var toDoTable = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet var toDoList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "toDoTable") != nil {
            
            toDoTable = UserDefaults.standard.object(forKey: "toDoTable") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return toDoTable.count
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoTable[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            toDoTable.remove(at: indexPath.row)
            
            UserDefaults.standard.set(toDoTable, forKey: "toDoTable")
            
            toDoList.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        toDoList.reloadData()
    }

}

