//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Gabo on 1/29/22.
//  Copyright © 2022 Gabo. All rights reserved.
//

import UIKit

protocol ToDoCellDelegate {
    func checkMarkTapped(_ sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
    var delegate: ToDoCellDelegate?
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        delegate?.checkMarkTapped(self)
    }
    
}
