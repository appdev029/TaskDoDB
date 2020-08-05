//
//  Task.swift
//  TaskDo
//
//  Created by Rai on 7/20/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import Foundation

struct Task {
    var name: String
    var createdDate: Date!
    
    init(task: String) {
        self.name = task
        self.createdDate = Date()
    }
    
    init(task: String, createdDate: Date) {
        self.name = task
        self.createdDate = createdDate
    }
}
