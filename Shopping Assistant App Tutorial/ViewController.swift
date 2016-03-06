//
//  ViewController.swift
//  Shopping Assistant App Tutorial
//
//  Created by Cynthia Whitlatch on 3/5/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var products = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sampleProduct()
        let context = (UIApplication.sharedApplication().delegate! as! AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "Product")
        var results : [AnyObject]?
        
        do {
            results = try context.executeFetchRequest(request)
        } catch _ {
            results = nil
        }
        
        if results != nil {
            self.products = results! as! [Product]
        }
    }

    func sampleProduct () {
//        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedObjectContext = delegate.managedObjectContext
//        let entity = NSEntityDescription.entityForName("Product", inManagedObjectContext: managedObjectContext)
//        let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
//        managedObject.setValue("Running Shoes", forKey: "title")
//        
//        do {
//            try managedObjectContext.save()
//        } catch _ {
//            print("Error")
//        }
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Product")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            products = results as! [NSManagedObject]
            self.tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
        
    func saveData(){
        // SAVE DATA
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Devices", inManagedObjectContext: managedObjectContext)
        let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        managedObject.setValue("iPhone \(products.count + 1)", forKey: "name")
        managedObject.setValue("Apple", forKey: "company")
        
        do {
            try managedObjectContext.save()
        }
        catch let error as NSError {
            print(error)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        let product = self.products[indexPath.row]
//        return cell
//        
//    }
        let aCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let person = products[indexPath.row]
        aCell.textLabel?.text = person.valueForKey("name") as? String
        
        return aCell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
        
    }
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//    }


}

