//
//  AddItemTableViewDel.swift
//  bucket_list
//
//  Created by Tri Pham on 2/14/17.
//  Copyright © 2017 Tri Pham. All rights reserved.
//

import Foundation

protocol AddItemTableViewDel: class {
    func savedPressed(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelPressed(by controller: AddItemTableViewController)
}
