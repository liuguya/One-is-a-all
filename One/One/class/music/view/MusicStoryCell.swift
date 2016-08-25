//
//  MusicStoryCell.swift
//  One
//
//  Created by 阳阳 on 16/8/24.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class MusicStoryCell: UITableViewCell {
    var dataModel:MusicDataModel?{
        
        didSet{
            if dataModel != nil{
                showData()
            }
            
        }
    }
    
    func showData(){
        //1.删除之前的子视图
        for oldSub in contentView.subviews {
            oldSub.removeFromSuperview()
        }
        
        //添加子视图
        //1.标题
        let x:CGFloat = 15
        let titleLable = UILabel.createLabel(dataModel!.story_title!, font: UIFont.boldSystemFontOfSize(24), textAlignment: .Left, textColor: UIColor.blackColor())
        titleLable.frame = CGRectMake(x, 0, kSreenWith-10*2, 40)
        contentView.addSubview(titleLable)
        
        //作者
        let autoLabel = UILabel.createLabel(dataModel!.story_author!.user_name!, font: UIFont.systemFontOfSize(10), textAlignment: .Left, textColor: UIColor(red: 13.0/255.0, green: 148.0/255.0, blue: 252.0/255.0, alpha: 1.0))
        autoLabel.frame = CGRectMake(x, 40, 100, 20)
        contentView.addSubview(autoLabel)
        
        
        //内容
        let w:CGFloat = kSreenWith-15*2
        let y:CGFloat = 60
        let font = UIFont.systemFontOfSize(17)
        
        let str = dataModel!.story!.stringByReplacingOccurrencesOfString("<br>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        let desH:CGFloat = MusicStoryCell.getLabHeigh(str, font: font, width: w)
        
        let descLabel = UILabel.createLabel(str, font: font, textAlignment: .Left, textColor: UIColor.blackColor())
        descLabel.numberOfLines = 0
        descLabel.frame = CGRectMake(x, y, w, desH)
        contentView.addSubview(descLabel)
        
        
        //出品方
        let chargeEdtLabel = UILabel.createLabel(dataModel?.charge_edt!, font: UIFont.systemFontOfSize(10), textAlignment: .Left, textColor: UIColor.lightGrayColor())
        chargeEdtLabel.frame = CGRectMake(10, 65+desH, 300, 20)
        contentView.addSubview(chargeEdtLabel)
        
        
    }
    
    
    
 
    
    class func heightWithModel(model:MusicDataModel?)->CGFloat{
        var h:CGFloat = 0
        //内容
        if model != nil{
            let w:CGFloat = kSreenWith-15*2
            let y:CGFloat = 100
            let font = UIFont.systemFontOfSize(17)
            
            let str = model!.story!.stringByReplacingOccurrencesOfString("<br>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            h = getLabHeigh(str, font: font, width: w) + y
        }
        
        return h
        
    }
    
    class func createMusicStoryCell(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:MusicDataModel) -> MusicStoryCell {
        let cellId = "musicStoryId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? MusicStoryCell
        if cell == nil {
            cell = MusicStoryCell(style: .Default, reuseIdentifier: cellId)
        }
        
        cell?.dataModel = model
        return cell!
        
    }

    
    
    
    class func getLabHeigh(labelStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        let statusLabelText: NSString = labelStr
        
        let size = CGSizeMake(width, 6000)
        
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName)
        
        let strSize = statusLabelText.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context:nil).size
        
        return strSize.height
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
