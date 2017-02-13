//
//  ViewController.swift
//  bucket_list
//
//  Created by Tri Pham on 2/13/17.
//  Copyright © 2017 Tri Pham. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController {
    var tasks = ["Wake up", "Change clothes", "Go to the dojo"]
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let addItemTableController = navigationController.topViewController as! AddItemTableViewController
        AddItemTableViewController.del = self
        
    }
}

		
