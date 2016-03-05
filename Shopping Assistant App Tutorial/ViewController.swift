//
//  ViewController.swift
//  Shopping Assistant App Tutorial
//
//  Created by Cynthia Whitlatch on 3/5/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sampleProduct()
    }

    func sampleProduct () {
        let context = (UIApplication.sharedApplication().delegate! as! AppDelegate)
        let product = NSEntityDescription.insertNewObjectForEntityForName("product", inManagedObjectContext: context) as! Products
        product.title = "Running Shoes"
        
        do {
            try context.save()
        } catch {
            
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Saucony Shoes"
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
        
    }
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//    }


}

