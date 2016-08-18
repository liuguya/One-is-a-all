//
//  UIButton+Util.swift
//  TestKitchen
//
//  Created by 阳阳 on 16/8/15.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

extension UIButton{
    class func createButton(title:String?,bgImageName:String?,selectBgImageName:String?,target:AnyObject?,action:Selector)->UIButton{
        let btn = UIButton(type: .Custom)
        if let btntitle = title{
            btn.setTitle(btntitle, forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        }
        if let btnbgImageName = bgImageName{
            btn.setBackgroundImage(UIImage(named: btnbgImageName), forState: .Normal)
        }
        if let btnselectBgImageName = selectBgImageName{
            btn.setImage(UIImage(named: btnselectBgImageName), forState: .Normal)
        }
        
        if let btnTarget = target{
            btn.addTarget(btnTarget, action: action, forControlEvents: .TouchUpInside)
        }
        
        
        
       return btn
    }
}
