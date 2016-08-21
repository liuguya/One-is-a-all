//
//  Download.swift
//  One
//
//  Created by 阳阳 on 16/8/15.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import Alamofire

protocol DownloadDelegate:NSObjectProtocol{
    //下载成功
    func downloader(downloader: Download, didFinishWithData data: NSData?)
    
    //下载失败
    func downloader(downloader: Download, didFailWithError error: NSError)

}


class Download: NSObject {
    //代理属性
    var delegate: DownloadDelegate?
     var type: Int?
    //下载的方法
    func postWithUrl(urlString:String,params:Dictionary<String,String>?){
        Alamofire.request(.POST, urlString, parameters: params, encoding: ParameterEncoding.URL, headers: nil).responseData { (response) in
            switch response.result{
            case .Failure(let error):
                self.delegate?.downloader(self, didFailWithError: error)
            case .Success:
                self.delegate?.downloader(self, didFinishWithData: response.data!)
            }
        }
    }
    
    func getWithUrl(urlString:String){
        Alamofire.request(.GET, urlString).responseData {
            (response) in
            switch response.result{
            case .Failure(let error):
               self.delegate?.downloader(self, didFailWithError: error)
            case .Success:
               self.delegate?.downloader(self, didFinishWithData: response.data!)
            }
        }
    }
}
