//
//  MovieViewController.swift
//  One
//
//  Created by 阳阳 on 16/8/18.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import XWSwiftRefresh
//import SwiftyJSON
class MovieViewController: BaseViewController {
    
    //表格
    private var tbView:UITableView?
    
    //数据源
    lazy var dataArray = NSMutableArray()
    
    private var curPage:Int = 0
    private var count:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //电影
       createNav()
        //创建表格
        createTableView()
        //下载数据
        createDownload()
    }
    //导航
    func createNav(){
        addNavTitle("电影")
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
    
    //创建表格
    func createTableView(){
        self.automaticallyAdjustsScrollViewInsets = false
        tbView = UITableView(frame: CGRectZero, style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        tbView?.separatorStyle = .None
        view.addSubview(tbView!)
        
        //约束
        tbView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
        
        //上拉加载更多
        self.tbView?.footerView = XWRefreshAutoNormalFooter(target: self, action: #selector(loadNextPage))
    }
    func loadNextPage(){
        curPage = count!
        self.createDownload()
        
    }
    
    //下载数据
    func createDownload(){
        
        let urlString = String(format: "\(movieUrl)%ld", curPage)
        
        let download = Download()
        download.delegate = self
        download.getWithUrl(urlString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

//MARK:Download代理下载
extension MovieViewController:DownloadDelegate{
    func downloader(downloader: Download, didFailWithError error: NSError) {
        print(error)
    }
    func downloader(downloader: Download, didFinishWithData data: NSData?){
        let jsonData = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
        let array = jsonData["data"] as! Array<Dictionary<String,AnyObject>>
        
        for i in array{
            let model = MovieModel()
            model.setValuesForKeysWithDictionary(i)
            self.dataArray.addObject(model)
        }
        
        
        dispatch_async(dispatch_get_main_queue()) {
            //刷新表格
            let cn = self.dataArray.count
            let model = self.dataArray[cn-1] as! MovieModel
            self.count = Int(model.id!)
            self.tbView?.reloadData()
            self.tbView?.footerView?.endRefreshing()
        }
    }
}


//MARK:UITableView代理
extension MovieViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "moviewCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? MovieCell
        if nil == cell{
            cell = NSBundle.mainBundle().loadNibNamed("MovieCell", owner: nil, options: nil).last as? MovieCell
        }
        let model = self.dataArray[indexPath.row] as! MovieModel
        cell?.configModel(model)
        cell?.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }
    
}
