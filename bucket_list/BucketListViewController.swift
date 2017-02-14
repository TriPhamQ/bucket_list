//
//  ViewController.swift
//  bucket_list
//
//  Created by Tri Pham on 2/13/17.
//  Copyright © 2017 Tri Pham. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewDel {
    var tasks = ["Wake up", "Change clothes", "Go to the dojo"]
    var edit = false
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTask", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
//    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        edit = true
        performSegue(withIdentifier: "AddItemSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if edit == true {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.del = self
            let indexPath = sender as! NSIndexPath
            let item = tasks[indexPath.row]
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath
        }
        else {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.del = self
        }
        edit = false
        
//        if segue.identifier == "AddItemSegue" {
//            let navigationController = segue.destination as! UINavigationController
//            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
//            addItemTableViewController.del = self
//        }
//        else if segue.identifier == "EditItemSegue" {
//            let navigationController = segue.destination as! UINavigationController
//            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
//            addItemTableViewController.del = self
//            
//            let indexPath = sender as! NSIndexPath
//            let item = tasks[indexPath.row]
//            addItemTableViewController.item = item
//            addItemTableViewController.indexPath = indexPath
//        }
    }
    
    func cancelPressed(by controller: AddItemTableViewController) {
        print("I am the hidden controller but I am responding to the cancel button pressed on the top view controller")
        dismiss(animated: true, completion: nil)
    }
    
    func savedPressed(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        print("Recieved text: \(text)")
        if text != "", let ip = indexPath {
            tasks[ip.row] = text
        }
        else if text != "" {
            tasks.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

		
