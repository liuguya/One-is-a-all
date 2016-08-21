//
//  ReadText.swift
//  One
//
//  Created by 阳阳 on 16/8/19.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class ReadText: UIView {
    
    private var tbView:UITableView?
    
    //显示数据
    var textModel:ReadTextModel?{
        didSet{
            
            //刷新表格
            tbView?.reloadData()
        }
    }
    
    init(){
        super.init(frame:CGRectZero)
        
        tbView = UITableView(frame: CGRectZero, style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        //tbView?.separatorStyle = .None
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

extension ReadText:UITableViewDelegate,UITableViewDataSource{
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       let height = self.bounds.height/3
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      

        if textModel?.data?.essay?.count > 0{
        
            let cellId = "textCellId"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReadTextCell
            if cell == nil {
                cell = NSBundle.mainBundle().loadNibNamed("ReadTextCell", owner: nil, options: nil).last as? ReadTextCell
            }
            let model = textModel?.data?.essay![indexPath.row]
            cell?.showData(model!)
            //cell?.backgroundColor = UIColor.blackColor()
            return cell!
        }
        
        return UITableViewCell()
        
    }
        
    
}
