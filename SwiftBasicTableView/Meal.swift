//
//  Meal.swift
//  SwiftBasicTableView
//
//  Created by guo on 16/4/18.
//  Copyright © 2016年 guo. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties
    
    var name:   String
    var photo:  UIImage?
    var rating: Int
    
    // MARK: Init
    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name   = name
        self.photo  = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            
            // Only a failable initializer can return 'nil'. So add ? to the end of init keyword
            return nil
        }
    }
}
