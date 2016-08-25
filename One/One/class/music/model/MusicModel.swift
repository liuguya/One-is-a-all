//
//  MusicModel.swift
//  One
//
//  Created by 阳阳 on 16/8/22.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import SwiftyJSON
class MusicModel: NSObject {
    var res:NSNumber?
    var data:MusicDataModel?
    
    class func parseModel(data:NSData)->MusicModel{
        let model = MusicModel()
        let jsonData = JSON(data:data)
        model.res = jsonData["res"].number
        let dataDict = jsonData["data"]
        model.data = MusicDataModel.parseModel(dataDict)
        return model
    }
}

class MusicDataModel:NSObject{
    var id:String?
    var title:String?
    var cover:String?
    
    var isfirst:String?
    var story_title:String?
    var story:String?
    
    var lyric:String?
    var info:String?
    var platform:String?
    
    var music_id:String?
    var charge_edt:String?
    var related_to:String?
    
    var web_url:String?
    var praisenum:NSNumber?
    var maketime:String?
    
    var last_update_date:String?
    var read_num:String?
    var author:MusicAuthorModel?
    
    var story_author:MusicStoryAuthorModel?
    var sharenum:NSNumber?
    var commentnum:NSNumber?
    
    class func parseModel(jsonData:JSON)->MusicDataModel{
        let model = MusicDataModel()
        
        model.id = jsonData["id"].string
        model.title = jsonData["title"].string
        model.cover = jsonData["cover"].string
        
        model.isfirst = jsonData["isfirst"].string
        model.story_title = jsonData["story_title"].string
        model.story = jsonData["story"].string
        
        model.lyric = jsonData["lyric"].string
        model.info = jsonData["info"].string
        model.platform = jsonData["platform"].string
        
        model.music_id = jsonData["music_id"].string
        model.charge_edt = jsonData["charge_edt"].string
        model.related_to = jsonData["related_to"].string
        
        model.web_url = jsonData["web_url"].string
        model.praisenum = jsonData["praisenum"].number
        model.maketime = jsonData["maketime"].string
        model.last_update_date = jsonData["last_update_date"].string
        
        model.read_num = jsonData["read_num"].string
        model.author = MusicAuthorModel.parseModel(jsonData["author"])
        
        model.story_author = MusicStoryAuthorModel.parseModel(jsonData["story_author"])
        
        model.sharenum = jsonData["sharenum"].number
        model.commentnum = jsonData["commentnum"].number
        return model
    }
 
}

class MusicAuthorModel: NSObject {
    var user_id:String?
    var user_name:String?
    var web_url:String?
    var desc:String?
    
    class func parseModel(jsonData:JSON)->MusicAuthorModel{
        let model = MusicAuthorModel()
        model.user_id = jsonData["user_id"].string
        model.user_name = jsonData["user_name"].string
        model.web_url = jsonData["web_url"].string
        model.desc = jsonData["desc"].string
        return model
    }

}

class MusicStoryAuthorModel: NSObject {
    var user_id:String?
     var user_name:String?
     var web_url:String?
    
    class func parseModel(jsonData:JSON)->MusicStoryAuthorModel{
        let model = MusicStoryAuthorModel()
        model.user_id = jsonData["user_id"].string
        model.user_name = jsonData["user_name"].string
        model.web_url = jsonData["web_url"].string
        return model
    }
}
