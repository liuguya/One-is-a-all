//
//  ReadDetailRecommendModel.swift
//  One
//
//  Created by 阳阳 on 16/8/29.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import SwiftyJSON

class ReadDetailRecommendModel: NSObject {
    var res:NSNumber?
    var data:Array<ReadDetailRecommendDataModel>?
    
    class func parseModel(data:NSData)->ReadDetailRecommendModel{
        let model = ReadDetailRecommendModel()
        let jsonData = JSON(data:data)
        model.res = jsonData["res"].number
        let dataArray = jsonData["data"]
        var array = Array<ReadDetailRecommendDataModel>()
        for (_,subject) in dataArray{
            let daModel = ReadDetailRecommendDataModel.parseModel(subject)
            array.append(daModel)
        }
        
        model.data = array
        return model
    }
    
    
}

class ReadDetailRecommendDataModel:NSObject{
    var content_id:String?
    var hp_title:String?
    var hp_makettime:String?
    var guide_word:String?
    var author:Array<ReadDetailRecommendAutoModel>?
    var has_audio:Bool?
    
    class func parseModel(jsonData:JSON)->ReadDetailRecommendDataModel {
        let dataModel = ReadDetailRecommendDataModel()
        dataModel.content_id = jsonData["content_id"].string
        dataModel.hp_title = jsonData["hp_title"].string
        dataModel.hp_makettime = jsonData["hp_makettime"].string
        dataModel.guide_word = jsonData["guide_word"].string
        
        var array = Array<ReadDetailRecommendAutoModel>()
        for (_,subject) in jsonData["author"]{
            let model = ReadDetailRecommendAutoModel.parseModel(subject)
            array.append(model)
        }
        
        
        dataModel.author = array
        
        dataModel.has_audio = jsonData["has_audio"].bool
        return dataModel
    }
}

class ReadDetailRecommendAutoModel:NSObject{
    var user_id:String?
    var user_name:String?
    var web_url:String?
    var desc:String?
    var wb_name:String?
    class func parseModel(jsonData:JSON)->ReadDetailRecommendAutoModel {
        let auModel = ReadDetailRecommendAutoModel()
        auModel.user_id = jsonData["user_id"].string
        auModel.user_name = jsonData["user_name"].string
        auModel.web_url = jsonData["web_url"].string
        auModel.desc = jsonData["desc"].string
        auModel.wb_name = jsonData["wb_name"].string
        
        
        return auModel
    }
}

