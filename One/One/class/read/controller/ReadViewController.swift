//
//  ReadViewController.swift
//  One
//
//  Created by 阳阳 on 16/8/18.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class ReadViewController: BaseViewController {
    
    private var readView:ReadView?
    private var readText:ReadText?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor();
        //导航
        createNav()
        
        //下载数据阅读banner
        createDownload()
        
        //下载阅读文本text
        createDownloadText()
        
        createHomePageView()
        
        
        
        
    }
    
    //初始化视图
    func createHomePageView(){
        self.automaticallyAdjustsScrollViewInsets = false
        readView = ReadView()
        //readView?.layer.borderColor = UIColor.redColor().CGColor
        //readView?.layer.borderWidth = 2
        view.addSubview(readView!)
        readView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            //make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
            make.left.right.equalTo(self!.view)
            make.top.equalTo(self!.view).offset(64)
            make.height.equalTo(150)
            })
        
        readText = ReadText()
        readText!.layer.masksToBounds = true
        readText!.layer.cornerRadius = 10
        readText!.layer.borderWidth = 2
        readText!.layer.borderColor = UIColor(white: 0.1, alpha: 0.1).CGColor
        
        readText!.layer.shadowOffset = CGSizeMake(4,3)
        readText!.layer.shadowOpacity = 1
        readText!.layer.shadowRadius = 4
        readText!.layer.shadowColor = UIColor.blackColor().CGColor
        view.addSubview(readText!)
        readText!.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.top.equalTo((self!.readView?.snp_bottom)!).offset(5)
            make.left.equalTo(self!.view).offset(10)
            make.right.equalTo(self!.view).offset(-10)
            make.bottom.equalTo(self!.view).offset(-64)
            })

        
        
    }
    
    //导航
    func createNav(){
        addNavTitle("阅读")
        //搜索
        addNavBtn(self, action: #selector(searchAction), isLeft: true, bgImageName: "magnifying")
        //个人中心
        addNavBtn(self, action: #selector(personAction), isLeft: false, bgImageName: "person")
    }
    
    //搜索
    func searchAction(){
        print("搜索")
    }
    //个人中心
    func personAction(){
        print("个人中心")
    }

    //下载数据阅读banner
    func createDownload(){
        let download = Download()
        download.type = 10
        download.delegate = self
        download.getWithUrl(readBannerUrl)
        
    }
    
    //下载阅读文本text
    func createDownloadText(){
        let download = Download()
        download.type = 20
        download.delegate = self
        download.getWithUrl(readTextUrl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

//MARK:Download代理
extension ReadViewController:DownloadDelegate{
    func downloader(downloader: Download, didFailWithError error: NSError) {
        print(error)
    }
    func downloader(downloader: Download, didFinishWithData data: NSData?) {
        if (downloader.type)! == 10{
            if let jsonData = data {
                let model = ReadBannerModel.parseModel(jsonData)

                //显示数据
                dispatch_async(dispatch_get_main_queue(), {
                    
                    [weak self] in
                    self!.readView?.bannerModel = model
                 
                })
            }
        }else if (downloader.type)! == 20{
            if let jsonData = data {
                let model = ReadTextModel.parseModel(jsonData)
                //显示数据
                dispatch_async(dispatch_get_main_queue(), {
                    
                    [weak self] in
                    self!.readText?.textModel = model
                    
                 })
            }
            
        }
        
        
    }
}
