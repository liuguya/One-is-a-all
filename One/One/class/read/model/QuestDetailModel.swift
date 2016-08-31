//
//  QuestDetailModel.swift
//  One
//
//  Created by 阳阳 on 16/8/30.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import SwiftyJSON
class QuestDetailModel: NSObject {
    var res:NSNumber?
    var data:QuestDetailDataModel?
    class func parseModel(data:NSData)->QuestDetailModel{
        let model = QuestDetailModel()
        let jsonData = JSON(data:data)
        model.res = jsonData["res"].number
        let dataDict = jsonData["data"]
        model.data = QuestDetailDataModel.parseModel(dataDict)
        return model
    }

}

class  QuestDetailDataModel: NSObject {
    var question_id:String?
    var question_title:String?
    var question_content:String?
    var question_makettime:String?
    
    
    var answer_title:String?
    var answer_content:String?
    var recommend_flag:String?
    
    var charge_edt:String?
    var last_update_date:String?
    var web_url:String?
    
    var read_num:String?
    var guide_word:String?
    var praisenum:NSNumber?
    var sharenum:NSNumber?
    var commentnum:NSNumber?
    class func parseModel(jsonData:JSON)->QuestDetailDataModel{
        let dModel = QuestDetailDataModel()
        dModel.question_id = jsonData["question_id"].string
        dModel.question_title = jsonData["question_title"].string
        dModel.question_content = jsonData["question_content"].string
        
        dModel.question_makettime = jsonData["question_makettime"].string
        
        dModel.answer_title = jsonData["answer_title"].string
        dModel.answer_content = jsonData["answer_content"].string
        dModel.recommend_flag = jsonData["recommend_flag"].string
        
        dModel.charge_edt = jsonData["charge_edt"].string
        dModel.last_update_date = jsonData["last_update_date"].string
        dModel.web_url = jsonData["web_url"].string
        
        dModel.read_num = jsonData["read_num"].string
        dModel.guide_word = jsonData["guide_word"].string
        dModel.praisenum = jsonData["praisenum"].number
        dModel.sharenum = jsonData["sharenum"].number
        dModel.commentnum = jsonData["commentnum"].number
        return dModel
    }
}
