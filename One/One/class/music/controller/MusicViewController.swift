//
//  MusicViewController.swift
//  One
//
//  Created by 阳阳 on 16/8/18.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import Alamofire
//音乐
class MusicViewController: BaseViewController {

    var musicView:MusicView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //导航
        createNav()
        
        //下载数据
        createDownload()
        //初始化视图
        createHomePageView()
        
       
    }
    
    //导航
    func createNav(){
        addNavTitle("音乐")
        //搜索
        addNavBtn(self, action: #selector(searchAction), isLeft: true, bgImageName: "magnifying")
        //个人中心
        addNavBtn(self, action: #selector(personAction), isLeft: false, bgImageName: "person")
    }
    
    //初始化视图
    func createHomePageView(){
        self.automaticallyAdjustsScrollViewInsets = false
        musicView = MusicView()
        //musicView?.layer.borderColor = UIColor.redColor().CGColor
        //musicView?.layer.borderWidth = 2
        view.addSubview(musicView!)
        musicView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        
            })
    }
    
    //搜索
    func searchAction(){
        print("搜索")
    }
    //个人中心
    func personAction(){
        print("个人中心")
    }
    
    //下载数据的id
    func createDownload(){
        Alamofire.request(.GET, musicIdUrl).responseJSON {
            (response) in
            switch response.result {
            case .Failure:
                print("错误")
            case .Success(let data):
                
                if data.isKindOfClass(NSDictionary.self){
                    let dict = data as! Dictionary<String,AnyObject>
                    let array = dict["data"] as! NSArray
                    
                    
                    let str = array[0] as? String
                    self.createMusicLoad(str!)
                    
                }
                
            }
            
        }
        
    }
    //下载数据
    func createMusicLoad(id:String){
        print(id)
//        let urlString = String(format: "\(musicUrl)%@", id)
   let urlString = String(format: "\(musicUrl)%@", "930")
        let download = Download()
        download.delegate = self
        download.getWithUrl(urlString)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

//MARK:Download下载数据代理
extension MusicViewController:DownloadDelegate{
    func downloader(downloader: Download, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: Download, didFinishWithData data: NSData?) {
        if let jsonData = data {
            let model = MusicModel.parseModel(jsonData)
            //显示数据
            dispatch_async(dispatch_get_main_queue(), {
                [weak self] in
                self!.musicView?.datamodel = model.data
                
            })
        }

        
    }
}
