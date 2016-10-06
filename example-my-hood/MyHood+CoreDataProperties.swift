//
//  MyHood+CoreDataProperties.swift
//  example-my-hood
//
//  Created by momo on 10/5/16.
//  Copyright © 2016 Jo-Jo Lin. All rights reserved.
//

import Foundation
import CoreData


extension MyHood {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyHood> {
        return NSFetchRequest<MyHood>(entityName: "MyHood");
    }

    @NSManaged public var desciption: String?
    @NSManaged public var photo: NSData?
    @NSManaged public var title: String?

}
