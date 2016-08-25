//
//  HomeModel.swift
//  One
//
//  Created by 阳阳 on 16/8/16.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeReModel: NSObject {
    var res:NSNumber?
    var data:Array<HomeModel>?
    class func parseModel(data:NSData)->HomeReModel{
        let model = HomeReModel()
        let jsonData = JSON(data)
        model.res = jsonData["res"].number
        let hmArray = jsonData["data"]
        var dArray = Array<HomeModel>()
        
        for (_,subject) in hmArray{
            let hmodel = HomeModel.parseModel(subject)
            dArray.append(hmodel)
        }
        model.data = dArray
        
        
        return model
    }
}

class HomeModel: NSObject {
    var hpcontent_id:String?
    var hp_title:String?
    var author_id:String?
    
    var hp_img_url:String?
    var hp_img_original_url:String?
    var hp_author:String?
    
    var ipad_url:String?
    var hp_content:String?
    var hp_makettime:String?
    
    var last_update_date:String?
    var web_url:String?
    var wb_img_url:String?
    
    var praisenum:NSNumber?
    var sharenum:NSNumber?
    var commentnum:NSNumber?
    
    
    class func parseModel(jsonData:JSON)->HomeModel{
        let model = HomeModel()
      
        model.hpcontent_id = jsonData["hpcontent_id"].string
        model.hp_title = jsonData["hp_title"].string
        model.author_id = jsonData["author_id"].string
        model.hp_img_url = jsonData["hp_img_url"].string
        model.hp_author = jsonData["hp_author"].string
        model.ipad_url = jsonData["ipad_url"].string
        model.hp_content = jsonData["hp_content"].string
        
        model.hp_makettime = jsonData["hp_makettime"].string
        model.web_url = jsonData["web_url"].string
        model.wb_img_url = jsonData["wb_img_url"].string
        model.praisenum = jsonData["praisenum"].number
        model.sharenum = jsonData["sharenum"].number
        model.commentnum = jsonData["commentnum"].number
        return model
    }

}
