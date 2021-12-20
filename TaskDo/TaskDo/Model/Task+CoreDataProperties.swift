//
//  Task+CoreDataProperties.swift
//  TaskDo
//
//  Created by Rai on 8/6/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var name: String
    @NSManaged public var createdDate: Date

}
