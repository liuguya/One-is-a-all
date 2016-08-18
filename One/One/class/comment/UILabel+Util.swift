//
//  UILabel+Util.swift
//  TestKitchen
//
//  Created by 阳阳 on 16/8/15.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

extension UILabel{
    class func createLabel(text:String?,font:UIFont?,textAlignment:NSTextAlignment?,textColor:UIColor?)->UILabel{
        let  label = UILabel()
        if let labelText = text {
            label.text = labelText
        }
        if let labelFont = font{
            label.font = labelFont
        }
        
        if let labelTextAlignment = textAlignment{
            label.textAlignment = labelTextAlignment
        }
        
        if let labelColor = textColor{
            label.textColor = labelColor
        }
        
        return label
        
    }
}
