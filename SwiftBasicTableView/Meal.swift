//
//  Meal.swift
//  SwiftBasicTableView
//
//  Created by guo on 16/4/18.
//  Copyright © 2016年 guo. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    // MARK: Properties
    
    var name:   String
    var photo:  UIImage?
    var rating: Int
    
    // MARK: Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    // MARK: Types
    
    struct PropertyKey {
        
        // static indicate the constant is a class type
        static let nameKey   = "name"
        static let photoKey  = "photo"
        static let ratingKey = "rating"
    }
    
    // MARK: Init
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        self.name   = name
        self.photo  = photo
        self.rating = rating
        
        super.init()
        
        if name.isEmpty || rating < 0 {
            
            // Only a failable initializer can return 'nil'. So add ? to the end of init keyword
            return nil
        }
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        
        let name   = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo  = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        // Must call designated initializer.
        // Because the other initializer you defined on the Meal class, init?(name:photo:rating:), is a designated initializer, its implementation needs to call to its superclass’s initializer.
        self.init(name: name, photo: photo, rating: rating)
 
    }
}
