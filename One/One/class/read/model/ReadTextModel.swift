//
//  ReadTextModel.swift
//  One
//
//  Created by 阳阳 on 16/8/19.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import SwiftyJSON
class ReadTextModel: NSObject {

    var res:NSNumber?
    var data:TextDataModel?
    class func parseModel(data:NSData)->ReadTextModel{
        let model = ReadTextModel()
        let jsonData = JSON(data:data)
        model.res = jsonData["res"].number
        let dataDict = jsonData["data"]
        model.data = TextDataModel.parseModel(dataDict)
        return model
    }
}

class TextDataModel:NSObject{
    var essay:Array<TextEssayModel>?
    
    class func parseModel(jsonData:JSON)->TextDataModel{
        let model = TextDataModel()
        let essayArray = jsonData["essay"]
        var bArray = Array<TextEssayModel>()
        for (_,subjson) in essayArray{
            let essayModel = TextEssayModel.parseModel(subjson)
            bArray.append(essayModel)
        }
        model.essay = bArray

        return model
    }

}

class TextEssayModel:NSObject{
    var content_id:String?
    var hp_title:String?
    var hp_makettime:String?
    var guide_word:String?
    var author:Array<TextAutorModel>?
    var has_audio:Bool?
    
    class func parseModel(jsonData:JSON)->TextEssayModel{
        let model = TextEssayModel()
        model.content_id = jsonData["content_id"].string
        model.hp_title = jsonData["hp_title"].string
        model.hp_makettime = jsonData["hp_makettime"].string
        model.guide_word = jsonData["guide_word"].string
        let authorArray = jsonData["author"]
        var bArray = Array<TextAutorModel>()
        for (_,subject) in authorArray{
            let autorModel = TextAutorModel.parseModel(subject)
            bArray.append(autorModel)
        }
        model.author = bArray
        model.has_audio = jsonData["has_audio"].bool
        
        return model
    }
}

class TextAutorModel: NSObject {
    var user_id:String?
    var user_name:String?
    var web_url:String?
    var desc:String?
    var wb_name:String?
    
    class func parseModel(jsonData:JSON)->TextAutorModel{
        let model = TextAutorModel()
        model.user_id = jsonData["user_id"].string
        model.user_name = jsonData["user_name"].string
        model.web_url = jsonData["web_url"].string
        model.desc = jsonData["desc"].string
        model.wb_name = jsonData["wb_name"].string
        
        return model
    }
}
