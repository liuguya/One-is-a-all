//
//  ReadDetailCommentModel.swift
//  One
//
//  Created by 阳阳 on 16/8/29.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import SwiftyJSON
class ReadDetailCommentModel: NSObject {
    var res:NSNumber?
    var data:ReadDetailCommentDataModel?
    
    class func parseModel(data:NSData)->ReadDetailCommentModel{
        let model = ReadDetailCommentModel()
        let jsonData = JSON(data:data)
        model.res = jsonData["res"].number
        let dataDict = jsonData["data"]
        model.data = ReadDetailCommentDataModel.parseModel(dataDict)
        return model
    }
}

class ReadDetailCommentDataModel:NSObject{
    var count:NSNumber?
    var data:Array<ReadDetailCommentSubjectModel>?
    
    class func parseModel(jsonData:JSON)->ReadDetailCommentDataModel{
        let daModel = ReadDetailCommentDataModel()
        daModel.count = jsonData["count"].number
        let daArray = jsonData["data"]
        var array = Array<ReadDetailCommentSubjectModel>()
        for (_,subject) in daArray{
            let model = ReadDetailCommentSubjectModel.parseModel(subject)
            array.append(model)
        }
        daModel.data = array
        
        return daModel
    }
}

class ReadDetailCommentSubjectModel:NSObject{
    var id:String?
    var quote:String?
    var content:String?
    
    var praisenum:NSNumber?
    var input_date:String?
    var user:ReadDetailCommentUserModel?
    
    var touser:ReadDetailCommentUserModel?
    var type:NSNumber?
    
    class func parseModel(jsonData:JSON)->ReadDetailCommentSubjectModel{
        let model = ReadDetailCommentSubjectModel()
        model.id = jsonData["id"].string
        model.quote = jsonData["quote"].string
        model.content = jsonData["content"].string
        
        model.praisenum = jsonData["praisenum"].number
        model.input_date = jsonData["input_date"].string
        model.user = ReadDetailCommentUserModel.parseModel(jsonData["user"])
        model.touser = ReadDetailCommentUserModel.parseModel(jsonData["touser"])
        model.type = jsonData["type"].number
    
        
        return model
    }
}

class ReadDetailCommentUserModel:NSObject{
    var user_id:String?
    var user_name:String?
    var web_url:String?
    
    class func parseModel(jsonData:JSON)->ReadDetailCommentUserModel {
        let auModel = ReadDetailCommentUserModel()
        auModel.user_id = jsonData["user_id"].string
        auModel.user_name = jsonData["user_name"].string
        auModel.web_url = jsonData["web_url"].string
        return auModel
    }

}





