//
//  ReadSerialModel.swift
//  One
//
//  Created by 阳阳 on 16/8/29.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import SwiftyJSON
class ReadSerialModel: NSObject {
    var res:NSNumber?
    var data:ReadSerialDataModel?
    
    class func parseModel(data:NSData)->ReadSerialModel{
        let model = ReadSerialModel()
        let jsonData = JSON(data:data)
        model.res = jsonData["res"].number
        let dataDict = jsonData["data"]
        model.data = ReadSerialDataModel.parseModel(dataDict)
        return model
    }
}

class ReadSerialDataModel: NSObject {
    var id:String?
    var serial_id:String?
    var number:String?
    var title:String?
    var excerpt:String?
    var content:String?
    var charge_edt:String?
    var read_num:String?
    var maketime:String?
    var last_update_date:String?
    var audio:String?
    var web_url:String?
    var input_name:String?
    var last_update_name:String?
    var author:ReadSerialAutoModel?
    
    var praisenum:NSNumber?
    var sharenum:NSNumber?
    var commentnum:NSNumber?
    
    class func parseModel(jsonData:JSON)->ReadSerialDataModel{
        let rModel = ReadSerialDataModel()
        rModel.id = jsonData["id"].string
        rModel.serial_id = jsonData["serial_id"].string
        rModel.number = jsonData["number"].string
        
        rModel.title = jsonData["title"].string
        rModel.excerpt = jsonData["excerpt"].string
        rModel.content = jsonData["content"].string
        
        
        rModel.charge_edt = jsonData["charge_edt"].string
        rModel.read_num = jsonData["read_num"].string
        rModel.maketime = jsonData["maketime"].string
        rModel.last_update_date = jsonData["last_update_date"].string
        
     
        let dict = jsonData["author"]
        rModel.author = ReadSerialAutoModel.parseModel(dict)
     
        //rModel.author = array
        rModel.praisenum = jsonData["praisenum"].number
        rModel.sharenum = jsonData["sharenum"].number
        rModel.commentnum = jsonData["commentnum"].number
        
        return rModel
    }
    
    class ReadSerialAutoModel: NSObject {
        var user_id:String?
        var user_name:String?
        var web_url:String?
        var desc:String?
        class func parseModel(jsonData:JSON)->ReadSerialAutoModel {
            let model = ReadSerialAutoModel()
            model.user_id = jsonData["user_id"].string
            model.user_name = jsonData["user_name"].string
            model.web_url = jsonData["web_url"].string
            model.desc = jsonData["desc"].string
            return model
        }

    }

}
