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
    var serial:Array<TextSerialModel>?
    var question:Array<TextQuestionModel>?
    class func parseModel(jsonData:JSON)->TextDataModel{
        let model = TextDataModel()
        let essayArray = jsonData["essay"]
        var bArray = Array<TextEssayModel>()
        for (_,subjson) in essayArray{
            let essayModel = TextEssayModel.parseModel(subjson)
            bArray.append(essayModel)
        }
        model.essay = bArray
        
        
        let serialArray = jsonData["serial"]
        var sArray = Array<TextSerialModel>()
        for (_,subjson) in serialArray{
            let seriaModel = TextSerialModel.parseModel(subjson)
            sArray.append(seriaModel)
        }
        model.serial = sArray
        
        let questionArray = jsonData["question"]
        var qArray = Array<TextQuestionModel>()
        for (_,subjson) in questionArray{
            let questionModel = TextQuestionModel.parseModel(subjson)
            qArray.append(questionModel)
        }
        model.question = qArray
        

        return model
    }

}

class TextQuestionModel: NSObject {
    
    var question_id:String?
    var question_title:String?
    var answer_title:String?
    var answer_content:String?
    var question_makettime:String?
    
    class func parseModel(jsonData:JSON)->TextQuestionModel {
        let model = TextQuestionModel()
        model.question_id = jsonData["question_id"].string
        model.question_title = jsonData["question_title"].string
        model.answer_title = jsonData["answer_title"].string
        model.answer_content = jsonData["answer_content"].string
        model.question_makettime = jsonData["question_makettime"].string
        
        return model
    }
    

}


class TextSerialModel:NSObject{
    var id:String?
    var serial_id:String?
    var number:String?
    
    var title:String?
    var excerpt:String?
    var read_num:String?
    
    var maketime:String?
    var author:TextSerialAutoModel?
    var has_audio:Bool?
    class func parseModel(jsonData:JSON)->TextSerialModel{
        let model = TextSerialModel()
        model.id = jsonData["id"].string
        model.serial_id = jsonData["serial_id"].string
        model.number = jsonData["number"].string
        
        
        model.title = jsonData["title"].string
        model.excerpt = jsonData["excerpt"].string
        model.read_num = jsonData["read_num"].string
        
        model.maketime = jsonData["maketime"].string
        
        let autoArray = jsonData["author"]
        model.author = TextSerialAutoModel.parseModel(autoArray)
        
        
        
        
        model.has_audio = jsonData["has_audio"].bool
   
        
        return model
    }
}


class TextSerialAutoModel:NSObject{
    var user_id:String?
    var user_name:String?
    var web_url:String?
    var desc:String?
    class func parseModel(jsonData:JSON)->TextSerialAutoModel {
        let model = TextSerialAutoModel()
        model.user_id = jsonData["user_id"].string
        model.user_name = jsonData["user_name"].string
        model.web_url = jsonData["web_url"].string
        model.desc = jsonData["desc"].string
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


