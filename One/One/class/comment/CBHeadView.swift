//
//  CBHeadView.swift
//  One
//
//  Created by 阳阳 on 16/8/29.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class CBHeadView: UIView {
    private var titleLabel:UILabel?
    
     init(frame: CGRect,titleName:String) {
        super.init(frame: frame)
        //标题文字
        //100 + 30
        let titlW:CGFloat = 120

        let  x:CGFloat = 10
        titleLabel = UILabel.createLabel(nil, font: UIFont.systemFontOfSize(18), textAlignment: .Center, textColor: UIColor.blackColor())
        titleLabel?.frame = CGRectMake(x, 10, titlW, bounds.size.height - 20)
        titleLabel?.textAlignment = .Left
        titleLabel?.textColor = UIColor.grayColor()
        titleLabel?.font = UIFont.systemFontOfSize(10)
        titleLabel?.text = titleName
        addSubview(titleLabel!)
        
        backgroundColor = UIColor(white: 0.9, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
