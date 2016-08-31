//
//  ReadDetailModel.swift
//  One
//
//  Created by 阳阳 on 16/8/25.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import SwiftyJSON
class ReadDetailModel: NSObject {
    var res:NSNumber?
    var data:ReadDetailDataModel?
    
    class func parseModel(data:NSData)->ReadDetailModel{
        let model = ReadDetailModel()
        let jsonData = JSON(data:data)
        model.res = jsonData["res"].number
        let dataDict = jsonData["data"]
        model.data = ReadDetailDataModel.parseModel(dataDict)
        return model
    }
}

class ReadDetailDataModel: NSObject {
    var content_id:String?
    var hp_title:String?
    var sub_title:String?
    
    var hp_author:String?
    var auth_it:String?
    var hp_author_introduce:String?
    
    var hp_content:String?
    
    var hp_makettime:String?
    var wb_name:String?
    var wb_img_url:String?
    
    var last_update_date:String?
    var web_url:String?
    var guide_word:String?
    var audio:String?
    
    var author:Array<ReadDetailAutoModel>?
    var praisenum:NSNumber?
    var sharenum:NSNumber?
    var commentnum:NSNumber?
    
   

    
    class func parseModel(jsonData:JSON)->ReadDetailDataModel{
        let rModel = ReadDetailDataModel()
        rModel.content_id = jsonData["content_id"].string
        rModel.hp_title = jsonData["hp_title"].string
        rModel.sub_title = jsonData["sub_title"].string
        
        rModel.hp_author = jsonData["hp_author"].string
        rModel.auth_it = jsonData["auth_it"].string
        rModel.hp_author_introduce = jsonData["hp_author_introduce"].string
        
        
        rModel.hp_content = jsonData["hp_content"].string
        rModel.hp_makettime = jsonData["hp_makettime"].string
        rModel.wb_name = jsonData["wb_name"].string
        rModel.wb_img_url = jsonData["wb_img_url"].string
        
        rModel.last_update_date = jsonData["last_update_date"].string
        rModel.web_url = jsonData["web_url"].string
        rModel.guide_word = jsonData["guide_word"].string
        
        rModel.audio = jsonData["audio"].string
        
        var array = Array<ReadDetailAutoModel>()
        for (_,subject) in jsonData["author"]{
            let model = ReadDetailAutoModel.parseModel(subject)
            array.append(model)
        }
        
        rModel.author = array
        rModel.praisenum = jsonData["praisenum"].number
        rModel.sharenum = jsonData["sharenum"].number
        rModel.commentnum = jsonData["commentnum"].number
        
        return rModel
    }
    

}

class ReadDetailAutoModel:NSObject{
    var user_id:String?
    var user_name:String?
    var web_url:String?
    var desc:String?
    var wb_name:String?
    class func parseModel(jsonData:JSON)->ReadDetailAutoModel {
        let model = ReadDetailAutoModel()
        model.user_id = jsonData["user_id"].string
        model.user_name = jsonData["user_name"].string
        model.web_url = jsonData["web_url"].string
        model.desc = jsonData["desc"].string
        model.wb_name = jsonData["wb_name"].string
        return model
    }
}