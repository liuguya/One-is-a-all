//
//  QuestDetailCell.swift
//  One
//
//  Created by 阳阳 on 16/8/30.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class QuestDetailCell: UITableViewCell {

    @IBOutlet weak var question_titleLabel: UILabel!
    
    @IBOutlet weak var question_contentLabel: UILabel!
    
    @IBOutlet weak var answer_titleLabel: UILabel!
    
    @IBOutlet weak var answer_contentLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
 
    @IBOutlet weak var contentHeight: NSLayoutConstraint!
    
    @IBOutlet weak var bianjiLabel: UILabel!
    
    @IBOutlet weak var titleHeight: NSLayoutConstraint!
    
    var model:QuestDetailDataModel?{
        didSet{
            if model != nil{
                showData()
            }
        }
    }
    
    func  showData(){
        self.question_titleLabel.font = UIFont.boldSystemFontOfSize(20)
        self.question_titleLabel.text = model?.question_title!
        
        self.question_contentLabel.text = model?.question_content!
        
        
        //时间
        let str = NSString(string: (model?.question_makettime)!)
        let array = str.componentsSeparatedByString(" ")
        self.timeLabel?.text = "\(array[0])"
        
        //回答
        self.answer_titleLabel.font = UIFont.boldSystemFontOfSize(20)
        self.answer_titleLabel.text = model?.answer_title!
      
        
        //内容
        let cont =  model?.answer_content!.stringByReplacingOccurrencesOfString("<br>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        self.answer_contentLabel.text = cont
        
        let conH:CGFloat = MusicStoryCell.getLabHeigh(cont!, font: UIFont.systemFontOfSize(17), width: kSreenWith-10*2)
        contentHeight.constant = conH+10
        
        //编辑
        self.bianjiLabel.text = model?.charge_edt!
    }
    
    //计算高度
    class func heightWithComment(model:QuestDetailDataModel)->CGFloat{
        var height:CGFloat = 0
        
            //内容
            let desc = model.answer_content!
            //高度
            let desH:CGFloat = MusicStoryCell.getLabHeigh(desc, font: UIFont.systemFontOfSize(17), width: kSreenWith-10*2)
          
             height = desH + 250
            

       return height
    }
    

    
    class func createQuestDetailCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:QuestDetailModel) -> QuestDetailCell {
        let cellId = "questDetailCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? QuestDetailCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("QuestDetailCell", owner: nil, options: nil).last as? QuestDetailCell
        }
        
        cell!.model = model.data
        return cell!
        
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
