//
//  ReadBannerModel.swift
//  One
//
//  Created by 阳阳 on 16/8/18.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import SwiftyJSON
class ReadBannerModel: NSObject {
    var res:NSNumber?
    var data:Array<ReadData>?
    
    //解析
    class func parseModel(data:NSData)->ReadBannerModel{
        let model = ReadBannerModel()
        let jsonData = JSON(data:data)
        
        model.res = jsonData["res"].number
        
        let dataArray = jsonData["data"]
        var bArray = Array<ReadData>()
        for (_,subjson) in dataArray{
            //subjson装换成ReadData
            let bannerModel = ReadData.parseModel(subjson)
            bArray.append(bannerModel)
        }
        model.data = bArray
        
        return model
    }

    

    
}

class ReadData:NSObject {
    var id:String?
    var title:String?
    var cover:String?
    var bgcolor:String?
    var pv_url:String?
    class func parseModel(jsonData:JSON)->ReadData{
        let model = ReadData()
        model.id = jsonData["id"].string
        model.title = jsonData["title"].string
        model.cover = jsonData["cover"].string
        model.cover = jsonData["cover"].string
        model.pv_url = jsonData["pv_url"].string
        
        return model
    }
}
