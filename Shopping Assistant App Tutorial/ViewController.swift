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
        saveData()
        
        let context = (UIApplication.sharedApplication().delegate! as! AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "Product")
        var results : [AnyObject]?
        
        do {
            results = try context.executeFetchRequest(request)
        } catch _ {
            results = nil
        }
        
        if results != nil {
            self.products = results! as! [NSManagedObject]
        }
    }

    func sampleProduct() {
        
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
        
    func saveData() {
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = delegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Product", inManagedObjectContext: managedObjectContext)
        let managedObject = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        
        managedObject.setValue("Nike \(products.count + 1)", forKey: "title")
        managedObject.setValue("Shoe Store", forKey: "store")
        
        let image = UIImage(named: "nike")
        let imageData = NSData(data: UIImageJPEGRepresentation(image!, 1.0)!)
        managedObject.setValue(imageData, forKey: "image")
        
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

        let aCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let person = products[indexPath.row]
        aCell.textLabel?.text = person.valueForKey("title") as? String
        aCell.imageView?.image = UIImage(named: "nike")
        
        return aCell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("detail", sender: self)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
        
    }
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//    }


}

