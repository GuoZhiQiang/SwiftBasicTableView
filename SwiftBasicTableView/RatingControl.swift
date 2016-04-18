//
//  RatingControl.swift
//  SwiftBasicTableView
//
//  Created by guo on 16/4/18.
//  Copyright © 2016年 guo. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    
    var arr_ratingButtons = [UIButton]()
    let spacing   = 5
    let starCount = 5
    let stars     = 5
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // elf.backgroundColor = UIColor.purpleColor()
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage  = UIImage(named: "emptyStar")
        
        for _ in 0..<starCount {
            let btn_first = UIButton();
            //btn_first.backgroundColor = UIColor.redColor()
            btn_first.setImage(emptyStarImage, forState: .Normal)
            btn_first.setImage(filledStarImage, forState: .Selected)
            btn_first.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            btn_first.adjustsImageWhenHighlighted = false
            btn_first.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            arr_ratingButtons += [btn_first]
            addSubview(btn_first)
        }
    }
    
    override func layoutSubviews() {
        
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index, button) in arr_ratingButtons.enumerate() {
            
            buttonFrame.origin.x = CGFloat(index * (buttonSize+spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    // MARK: Actions
    
    func ratingButtonTapped(button: UIButton) {
        print("button clicked 👍")
        rating = arr_ratingButtons.indexOf(button)!+1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in arr_ratingButtons.enumerate() {
            button.selected = index < rating
        }
    }
    
    // 要和IB里设置的值相对应，这样 stack view 才知道这个view的大小,不然，就会把这个view当空白区域处理
    override func intrinsicContentSize() -> CGSize {
        
        let buttonSize = Int(frame.size.height)
        let width      = buttonSize+(stars-1)*(buttonSize+spacing)
        
        return CGSize(width: width, height: buttonSize)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
