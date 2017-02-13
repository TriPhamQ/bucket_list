//
//  AddItemTableViewController.swift
//  bucket_list
//
//  Created by Tri Pham on 2/13/17.
//  Copyright © 2017 Tri Pham. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    weak var del: CancelButtonDel?
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        print("cancel")
        del?.cancelButtonPressed(by: self)
    }

    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        print("save")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
