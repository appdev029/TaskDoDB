//
//  TaskViewModel.swift
//  TaskDo
//
//  Created by Rai on 7/20/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import Foundation

protocol DataViewModelProtocol {
    
    var shouldUpdate: ((Bool, Bool) -> Void)? { get set }
    func fetcModal()
    
    func createData(taskName:String)
}

class TaskViewModel: DataViewModelProtocol {
    
    
    var taskList  = [Task]()

    
    var shouldUpdate: ((Bool, Bool) -> Void)?
    
    func modalDicChange() {
        self.shouldUpdate?(true, false)
    }
    
    func createData(taskName: String) {
        let task = Task(task: taskName)
        self.taskList.append(task)
        self.modalDicChange()
    }
    
    func fetcModal() {
    }

}
