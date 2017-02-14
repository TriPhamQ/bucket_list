//
//  AddItemTableViewController.swift
//  bucket_list
//
//  Created by Tri Pham on 2/13/17.
//  Copyright © 2017 Tri Pham. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    weak var del: AddItemTableViewDel?
    var item: String?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        print("cancel")
        del?.cancelPressed(by: self)
    }

    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        print("save")
        
        if let text = inputTextField.text {
            del?.savedPressed(by: self, with: text, at: indexPath)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.text = item
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
