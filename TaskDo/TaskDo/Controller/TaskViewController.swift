//
//  TaskViewController.swift
//  TaskDo
//
//  Created by Rai on 7/20/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var taskViewModal = TaskViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.prepareForViewModal()
    }
    
    func prepareForViewModal() {
        self.taskViewModal.fetcModal()
        self.taskViewModal.shouldUpdate = {
            [unowned self] (finished, error) in
            if !error {
                self.reloadTableView()
            }
        }
    }

    func reloadTableView() {
        self.tableView.reloadData()
    }

    @IBAction func addButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Add", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            guard let textField = alertController.textFields?.first, let taskName = textField.text
                else {
                return
            }
            self.addTask(taskName: taskName)
        }
        
        alertController.addAction(addAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in}
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func addTask(taskName:String){
        self.taskViewModal.createData(taskName: taskName)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskViewModal.taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let task = taskViewModal.taskList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        cell.showData(data: task)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        let task = taskViewModal.taskList[indexPath.row]
        self.taskViewModal.deleteModal(task: task, indexPath: indexPath)
//        self.tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }


}
