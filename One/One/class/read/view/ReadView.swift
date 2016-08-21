//
//  ReadView.swift
//  One
//
//  Created by 阳阳 on 16/8/18.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class ReadView: UIView {

    //表格
    var type:Int?=10
    private var tbView:UITableView?
    //显示数据
    var bannerModel:ReadBannerModel?{
        didSet{
            //刷新表格
            tbView?.reloadData()
        }
    }
    
    init(){
        super.init(frame:CGRectZero)
        
        //创建表格视图
        tbView = UITableView(frame: CGRectZero, style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        tbView?.separatorStyle = .None
        self.addSubview(tbView!)
       
        //约束
        tbView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!)
        })
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//
extension ReadView:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var sectionNum = 1
        if type == 10{
            //banner
            sectionNum = 1
        }
        return sectionNum
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowNum = 0
        if type == 10{
            //banner
            rowNum = 1
        }
        
        return rowNum
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if type == 10{
            if bannerModel?.data?.count > 0{
                cell = ReadBannerCell.createReadCell(tableView, atIndexPath: indexPath, withModel: bannerModel!)
            }
            
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height:CGFloat = 0
        if type == 10{
            //banner
            height = 150
        }
        
        return height
    }
}
