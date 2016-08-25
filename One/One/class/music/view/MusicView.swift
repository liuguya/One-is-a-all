//
//  MusicView.swift
//  One
//
//  Created by 阳阳 on 16/8/22.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class MusicView: UIView {

    private var tbView:UITableView?
    //显示数据
    var datamodel:MusicDataModel?{
        didSet{
            if datamodel != nil{
                //刷新表格
                tbView?.reloadData()
            }
            
            
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
        tbView?.separatorStyle = .SingleLine
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

//MARK:UItableVIew代理
extension MusicView:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowNum = 0
        if (section == 0) || (section==1){
            //音乐->音乐故事
            rowNum = 1
        }
        
        return rowNum
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell=UITableViewCell()
        
        
        
        if indexPath.section == 0{
            //音乐简介
            if (datamodel != nil) {
                cell = MusicCell.createMusicCell(tableView, atIndexPath: indexPath, withModel: datamodel!)
                
                
            }
        }else if indexPath.section == 1{
            if (datamodel != nil){
                cell = MusicStoryCell.createMusicStoryCell(tableView, atIndexPath: indexPath, withModel: datamodel!)
            
            }
        
        }
        
        
        cell.selectionStyle = .None
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height:CGFloat = 0
        if indexPath.section == 0{
            if (datamodel != nil) {
                height = 400
            }
        }else if indexPath.section == 1{
            if datamodel != nil{
                height = MusicStoryCell.heightWithModel(datamodel!)
                print(height)
            }
        }
        
        return height
    }
   
}




