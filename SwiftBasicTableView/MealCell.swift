//
//  MealCell.swift
//  SwiftBasicTableView
//
//  Created by guo on 16/4/18.
//  Copyright © 2016年 guo. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {

    // MARK :Properties
    
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var img_meal: UIImageView!
    @IBOutlet weak var v_rating: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
