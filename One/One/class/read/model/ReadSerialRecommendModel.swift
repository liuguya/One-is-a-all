//
//  ReadSerialRecommendModel.swift
//  One
//
//  Created by 阳阳 on 16/8/30.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import SwiftyJSON
class ReadSerialRecommendModel: NSObject {
    var res:NSNumber?
    var data:Array<ReadSerialRecommendDataModel>?
    
    class func parseModel(data:NSData)->ReadSerialRecommendModel{
        let model = ReadSerialRecommendModel()
        let jsonData = JSON(data:data)
        model.res = jsonData["res"].number
        let dataArray = jsonData["data"]
        var array = Array<ReadSerialRecommendDataModel>()
        for (_,subject) in dataArray{
            let daModel = ReadSerialRecommendDataModel.parseModel(subject)
            array.append(daModel)
        }
        
        model.data = array
        return model
    }

}

class ReadSerialRecommendDataModel: NSObject {
    var id:String?
    var serial_id:String?
    var number:String?
    var title:String?
    var excerpt:String?
    var read_num:String?
    var maketime:String?
    
    var author:ReadSerialRecommendAutoModel?
    var has_audio:Bool?
    
    class func parseModel(jsonData:JSON)->ReadSerialRecommendDataModel {
        let dataModel = ReadSerialRecommendDataModel()
        dataModel.id = jsonData["id"].string
        dataModel.serial_id = jsonData["serial_id"].string
        dataModel.number = jsonData["number"].string
        dataModel.title = jsonData["title"].string
        
        dataModel.excerpt = jsonData["excerpt"].string
        dataModel.read_num = jsonData["read_num"].string
        dataModel.maketime = jsonData["maketime"].string
        
        let dic = jsonData["author"]
        dataModel.author = ReadSerialRecommendAutoModel.parseModel(dic)
        
        dataModel.has_audio = jsonData["has_audio"].bool
        return dataModel
    }
}

class ReadSerialRecommendAutoModel: NSObject {
    var user_id:String?
    var user_name:String?
    var web_url:String?
    var desc:String?
    class func parseModel(jsonData:JSON)->ReadSerialRecommendAutoModel {
        let model = ReadSerialRecommendAutoModel()
        model.user_id = jsonData["user_id"].string
        model.user_name = jsonData["user_name"].string
        model.web_url = jsonData["web_url"].string
        model.desc = jsonData["desc"].string
        return model
    }
    
}

