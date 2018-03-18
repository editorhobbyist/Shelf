//
//  ShelfTableViewController.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-13.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import UIKit

class ShelfTableViewController: UITableViewController {
    
    var shelf_items = ["hello","abc"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Count number of shelf items in list
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shelf_items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShelfItems", for: indexPath)
        cell.textLabel?.text = shelf_items[indexPath.row]
        return cell
    }
}
