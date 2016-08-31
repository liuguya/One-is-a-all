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
  
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor();
        //导航
        createNav()
        
        //下载阅读文本text
        createDownloadText()
        
        //下载数据阅读banner
        createDownload()
        
        //初始化视图
        createHomePageView()
        
    }
    
    //初始化视图
    func createHomePageView(){
        ProgressHUD.showOnView(self.view)
        
        self.automaticallyAdjustsScrollViewInsets = false
        readView = ReadView()
        //readView?.layer.borderColor = UIColor.redColor().CGColor
        //readView?.layer.borderWidth = 2
        view.addSubview(readView!)
        readView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
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
    
    //MARK:实现闭包
    func withClick(model:ReadTextModel){
        self.readView?.textModel = model
        self.readView?.clickChose = {
            (index,id,name) in
            print(id)
            if index == 0{
                let readDetailCtrl = ReadDetailViewController()
                readDetailCtrl.titleName = name
                readDetailCtrl.titleId = id
                self.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(readDetailCtrl, animated: true)
                self.hidesBottomBarWhenPushed = false
            }else if index == 1{
                let serialCtrl = ReadSerialViewController()
                serialCtrl.titleName = name
                serialCtrl.titleId = id
                self.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(serialCtrl, animated: true)
                self.hidesBottomBarWhenPushed = false
            
            }else if index == 2{
                let questCtrl = ReadQuestViewController()
                questCtrl.titleName = name
                questCtrl.titleId = id
                self.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(questCtrl, animated: true)
                self.hidesBottomBarWhenPushed = false
            
            }
        }
    
    }

}

//MARK:Download代理
extension ReadViewController:DownloadDelegate{
    func downloader(downloader: Download, didFailWithError error: NSError) {
        ProgressHUD.hideAfterFailOnView(self.view)
    }
    func downloader(downloader: Download, didFinishWithData data: NSData?) {
        if (downloader.type)! == 10{
            if let jsonData = data {
                let model = ReadBannerModel.parseModel(jsonData)

                //显示数据
                dispatch_async(dispatch_get_main_queue(), {
                    
                    [weak self] in
                    self!.readView?.bannerModel = model
                    //self!.readView?.type = 10
                 
                })
            }
        }else if (downloader.type)! == 20{
            if let jsonData = data {
                let model = ReadTextModel.parseModel(jsonData)
                //显示数据
                dispatch_async(dispatch_get_main_queue(), {
                    
                    [weak self] in
                    self!.withClick(model)
                    ProgressHUD.hideAfterSuccessOnView(self!.view)
                 })
 
            }
            
        }
        
        
        
        
    }
}
