//
//  ReadSerialViewController.swift
//  One
//
//  Created by 阳阳 on 16/8/29.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import XWSwiftRefresh
class ReadSerialViewController: BaseViewController {
    var titleName:String?
    var titleId:String?
    private var serialModel:ReadSerialModel?
    //页码
    private var page:String? = "0"
    //表格
    private var tbView:UITableView?
    
    //相关推荐model
    private var recommendModel:ReadSerialRecommendModel?
    
    //评论model
    private var commentModel:ReadDetailCommentModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 导航
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        createMyNav()
        
        //表格
        createTableView()
        
      
        //文章下载
        createDownload()
        
        //相关推荐
        createTuijianDownload()
        //评论列表
        createPinglunDownload()
        
    }
    
    //评论列表
    func createPinglunDownload(){
        if titleId != nil{
            //ProgressHUD.showOnView(self.view)
            let urlString = String(format: "\(lianzaiCommentUrl)%@/%@", titleId!,page!)
            let downlod = Download()
            downlod.delegate = self
            downlod.type = 30
            downlod.getWithUrl(urlString)
        }
        
    }

    
    //相关推荐
    func createTuijianDownload(){
        if titleId != nil {
            let urlString = String(format: "\(lianzaiRecommendUrl)%@", titleId!)
            let downlod = Download()
            downlod.delegate = self
            downlod.type = 20
            downlod.getWithUrl(urlString)
        }
    }

    
    //文章下载
    func createDownload(){
        if titleId != nil{
            //ProgressHUD.showOnView(self.view)
            let urlString = String(format: "\(lianzaiUrl)%@", titleId!)
            let downlod = Download()
            downlod.delegate = self
            downlod.type = 10
            downlod.getWithUrl(urlString)
        }
        
    }

    
    //导航
    func createMyNav(){
        if titleName != nil{
            addNavTitle(titleName!)
        }
        addNavBackBtn()
        
    }
    
    //表格
    func createTableView(){
        tbView = UITableView(frame: CGRectMake(0, 0, kSreenWith, kSreenHeight), style: .Plain)
        tbView?.delegate = self
        tbView?.separatorStyle = .None
        tbView?.dataSource = self
        view.addSubview(tbView!)
        //上拉加载更多
        self.tbView?.footerView = XWRefreshAutoNormalFooter(target: self, action: #selector(loadNextPage))
    }
    func loadNextPage(){
        //print(self.page!)
        self.createPinglunDownload()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
//MARK:Download代理
extension ReadSerialViewController:DownloadDelegate{
    func downloader(downloader: Download, didFailWithError error: NSError) {
        ProgressHUD.hideAfterFailOnView(self.view)
    }
    
    func downloader(downloader: Download, didFinishWithData data: NSData?) {
        //ProgressHUD.hideAfterSuccessOnView(self.view)
        //let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
        //文章
        if downloader.type == 10{
            
            if let jsonData = data{
                let model = ReadSerialModel.parseModel(jsonData)
                //print(model)
                //回到住线程刷新UI
                dispatch_async(dispatch_get_main_queue(), {
                   
                    self.serialModel = model
                    self.tbView?.reloadData()
                })
                
            }
            
        }
        else if downloader.type == 20{
            //相关推荐
            if let jsonData = data{
                
                //let str = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
                let model = ReadSerialRecommendModel.parseModel(jsonData)
                //print(model)
                dispatch_async(dispatch_get_main_queue(), {
                    //回到主线程
                   
                    self.recommendModel = model
                    self.tbView?.reloadSections(NSIndexSet(index:1), withRowAnimation: .Automatic)
                })
            }
        }
        else if downloader.type == 30{
            //评论
            if let jsonData = data{
                let model = ReadDetailCommentModel.parseModel(jsonData)
                //回到主线程
                dispatch_async(dispatch_get_main_queue(), {
                    self.commentModel = model
                    
                    let cnt = (self.commentModel?.data?.data?.count)!
                    let model = self.commentModel?.data?.data![cnt-1]
                    self.page = model?.id!
                    
                    self.tbView?.reloadSections(NSIndexSet(index:2), withRowAnimation: .Automatic)
                    
                    self.tbView?.footerView?.endRefreshing()
                })
            }
        
        }
        
    }


}

//MARK:UITableView
extension ReadSerialViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowNum = 0
        if section == 0{
            //文章
            rowNum = 2
        }else if section == 1{
            //相关推荐
            if recommendModel?.data?.count > 0{
                rowNum = (recommendModel?.data?.count)!
            }
        }else if section == 2{
            //评论列表
            if self.commentModel?.data?.data?.count > 0{
                rowNum = (self.commentModel?.data?.data?.count)!
            }
            
        }

            
        
        
        return rowNum
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //var cell =
        
        var cell = UITableViewCell()
        //文章信息
        if indexPath.section == 0{
            //文章信息
            if indexPath.row == 0{
                if serialModel != nil{
                    cell = ReadDetailCell.createReadSerialCellFor(tableView, atIndexPath: indexPath, withModel: serialModel!)
                }
                
            }else if indexPath.row == 1{
                if serialModel != nil{
                    cell = ReadAutoCell.createReadSerialAutoCellFor(tableView, atIndexPath: indexPath, withModel: serialModel!)
                }
            }
        }
        else if indexPath.section == 1{
            if recommendModel?.data?.count > 0{
                cell = ReadDetailRecommendCell.createReadSerialRecommendCellFor(tableView, atIndexPath: indexPath, withModel: recommendModel!)
            }
        }
        else if indexPath.section == 2{
            //评论
            if self.commentModel?.data?.data?.count>0{
                cell = ReadDetailCommentCell.createReadCommentCellFor(tableView, atIndexPath: indexPath, withModel: commentModel!)
                
                
            }
        }
        
        cell.selectionStyle = .None
       
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height:CGFloat = 0
        //文章
        if indexPath.section == 0{
            //文章信息
            if indexPath.row == 0{
                if serialModel != nil{
                    height = ReadDetailCell.heightWithSerialModel(serialModel)
                    //print(height)
                }
                
            }else if indexPath.row == 1{
                height = 100
            }
            
        }
        else if indexPath.section == 1{
            //相关推荐
            if self.recommendModel?.data?.count > 0{
                height = 100
            }
        }
        else if indexPath.section == 2{
            //评论
            if self.commentModel?.data?.data?.count > 0{
                let model = commentModel?.data?.data![indexPath.row]
                height = ReadDetailCommentCell.heightWithComment(model!)
            }
        }

        return height
    }
    
    
    //显示
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headView:UIView? = nil
        //相关推荐
        if section == 1{
            if recommendModel?.data?.count > 0{
                let  headView1 = CBHeadView.init(frame: CGRectMake(0,0,kSreenWith,30),titleName:"相关推荐")
                headView = headView1
            }
            
        }else if section == 2{
            if commentModel?.data?.data?.count > 0{
                let  headView1 = CBHeadView.init(frame: CGRectMake(0,0,kSreenWith,30),titleName:"评论列表")
                headView = headView1
            }
        }
        
        return headView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height:CGFloat = 0.0
        //相关推荐
        if section == 1 || section == 2 {
            if recommendModel?.data?.count > 0{
                height = 30
            }
        }
        return height
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //相关推荐点击
        if indexPath.section == 1{
            if recommendModel?.data?.count > 0{
                let model = self.recommendModel?.data![indexPath.row]
                let readDetailCtrl = ReadSerialViewController()
                readDetailCtrl.titleId = model?.id!
                readDetailCtrl.titleName = "连载"
                self.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(readDetailCtrl, animated: true)
                self.hidesBottomBarWhenPushed = false
                //print(model?.content_id!)
            }
        }
    }
    
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let h:CGFloat = 30
        if scrollView.contentOffset.y > h{
            scrollView.contentInset = UIEdgeInsetsMake(-h, 0, 0, 0)
        }else if scrollView.contentOffset.y > 0{
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0)
        }
        
    }


}
