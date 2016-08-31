//
//  QuestRecommendModel.swift
//  One
//
//  Created by 阳阳 on 16/8/31.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import SwiftyJSON
class QuestRecommendModel: NSObject {
    var res:NSNumber?
    var data:Array<QuestRecommendDataModel>?
    
    class func parseModel(data:NSData)->QuestRecommendModel{
        let model = QuestRecommendModel()
        let jsonData = JSON(data:data)
        model.res = jsonData["res"].number
        let dataArray = jsonData["data"]
        var array = Array<QuestRecommendDataModel>()
        for (_,subject) in dataArray{
            let daModel = QuestRecommendDataModel.parseModel(subject)
            array.append(daModel)
        }
        
        model.data = array
        return model
    }
}

class QuestRecommendDataModel:NSObject{
    var question_id:String?
    var question_title:String?
    var answer_title:String?
    var answer_content:String?
    var question_makettime:String?
    class func parseModel(jsonData:JSON)->QuestRecommendDataModel{
        let model = QuestRecommendDataModel()
        model.question_id = jsonData["question_id"].string
        model.question_title = jsonData["question_title"].string
        model.answer_title = jsonData["answer_title"].string
        
        model.answer_content = jsonData["answer_content"].string
        model.question_makettime = jsonData["question_makettime"].string
        return model
    }
}
