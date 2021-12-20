//
//  TaskViewModel.swift
//  TaskDo
//
//  Created by Rai on 7/20/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol DataViewModelProtocol {
    
    var shouldUpdate: ((Bool, Bool) -> Void)? { get set }
    func fetcModal()
    
    func createData(taskName:String)
    func deleteModal(task: Task, indexPath: IndexPath)
}

class TaskViewModel: DataViewModelProtocol {
    
    
    var taskList  = [Task]()

    
    var shouldUpdate: ((Bool, Bool) -> Void)?
    
    private func modalDicChange() {
        self.shouldUpdate?(true, false)
    }
    
    func createData(taskName: String) {
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate  else {
            return
        }
        let managedObjectContext = delegate.persistentContainer.viewContext
        
        do {
            let task = Task(context: managedObjectContext)
            task.name = taskName
            task.createdDate = Date()
            try managedObjectContext.save()
            self.taskList.append(task)
            self.shouldUpdate?(true, false)
        }
        catch let error as NSError {
            self.shouldUpdate?(false, true)
            print(error.userInfo)
        }
        
    }
    
    func fetcModal() {
        self.fetchTask()
    }
    

}

extension TaskViewModel {
    
     fileprivate func fetchTask() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate  else {
            return
        }
        
        let managedObjectContext = delegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
        do {
            
            let tasks = try managedObjectContext.fetch(fetchRequest)
            self.taskList = tasks
            self.shouldUpdate?(true, false)
        }
        catch let error as NSError {
            self.shouldUpdate?(false, true)
            print(error)
        }
    }
    
    func deleteModal(task: Task, indexPath: IndexPath) {
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate  else {
            return
        }
        
        let managedObjectContext = delegate.persistentContainer.viewContext
        do {
            
            managedObjectContext.delete(task)
            try managedObjectContext.save()
            self.taskList.remove(at: indexPath.row)
            self.shouldUpdate?(true, false)
        }
        catch let error as NSError {
            self.shouldUpdate?(false, true)
            print(error)
        }

    }


}
