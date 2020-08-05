//
//  TaskTableViewCell.swift
//  TaskDo
//
//  Created by Rai on 7/20/20.
//  Copyright © 2020 Rakesh. All rights reserved.
//

import UIKit

protocol TaskTableViewCellDataSource {
    func taskNameForCell(cell: TaskTableViewCell) -> String
}

extension Task: TaskTableViewCellDataSource {
    
    func taskNameForCell(cell: TaskTableViewCell) -> String {
        return self.name
    }
    
    
}

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var data:TaskTableViewCellDataSource?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showData(data: Any) {
        self.data = data as? TaskTableViewCellDataSource
        self.nameLabel.text = self.data?.taskNameForCell(cell: self)
    }

}
