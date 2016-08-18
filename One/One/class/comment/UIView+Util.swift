//
//  UIView+Util.swift
//  TestKitchen
//
//  Created by 阳阳 on 16/8/15.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

extension UIView{
    class func createView()->UIView{
        let tmpView = UIView()
        return tmpView
    }
    
    
    class func createShareView()->UIView{
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(white: 0.1, alpha: 0.1).CGColor
        
        view.layer.shadowOffset = CGSizeMake(4,3)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 4
        view.layer.shadowColor = UIColor.blackColor().CGColor
        
        return view
    }
    
    
}
