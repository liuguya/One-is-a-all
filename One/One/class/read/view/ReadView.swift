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
    var type:Int?{
        didSet{
        
        }
    }
    private var tbView:UITableView?
    //显示数据
    var bannerModel:ReadBannerModel?{
        didSet{
            //刷新表格
            tbView?.reloadData()
        }
    }
    
    var textModel:ReadTextModel?{
        didSet{
            
            //刷新表格
            tbView?.reloadData()
        }
    }
    
    init(){
        super.init(frame:CGRectZero)
        //print(type)
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
      
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowNum = 0
        if section == 0{
            //banner数据
            if self.bannerModel?.data?.count > 0{
                rowNum = 1
            }
        }else{
            if self.textModel?.data?.essay?.count>0{
                
                rowNum = 3
            }
            
        }
        
        return rowNum
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0{
            if self.bannerModel?.data?.count > 0{
                cell = ReadBannerCell.createReadCell(tableView, atIndexPath: indexPath, withModel: bannerModel!)
                cell.backgroundColor = UIColor.redColor()
                
                
                return cell
            }
        }else{
            if self.textModel?.data?.essay?.count>0{
               cell = ReadTextCell.createReadTextCell(tableView, atIndexPath: indexPath, withModel: textModel!)
                cell.layer.borderColor = UIColor.grayColor().CGColor
                //cell.layer.borderWidth = 1
                
                return cell
            }

        
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height:CGFloat = 0
        if indexPath.section == 0{
            if self.bannerModel?.data?.count > 0{
                //banner
                height = 150
            }
        
        }else{
            height = 100
        }
       
        
        return height
    }
}
