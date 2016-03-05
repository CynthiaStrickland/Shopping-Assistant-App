//
//  Products+CoreDataProperties.swift
//  Shopping Assistant App Tutorial
//
//  Created by Cynthia Whitlatch on 3/5/16.
//  Copyright © 2016 Cynthia Whitlatch. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Products {

    @NSManaged var title: String?
    @NSManaged var store: String?
    @NSManaged var image: NSData?

}
