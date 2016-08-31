//
//  ReadDetailRecommendCell.swift
//  One
//
//  Created by 阳阳 on 16/8/29.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class ReadDetailRecommendCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var autoLabel: UILabel!
    
    @IBOutlet weak var desLabel: UILabel!
    
    @IBOutlet weak var styleLabel: UILabel!
    
    var model:ReadDetailRecommendDataModel?{
        didSet{
            showData()
        }
    }
    
    var recommend:ReadSerialRecommendDataModel?{
        didSet{
            showRecommendData()
        }
    }
    
    var questRecommend:QuestRecommendDataModel?{
        didSet{
            showQuestData()
        }
    }
    func showQuestData(){
        titleLabel.text = questRecommend?.question_title!
        autoLabel.text = questRecommend?.answer_title!
        desLabel.text = questRecommend?.answer_content!
        
        styleLabel.layer.borderColor = UIColor(red: 13.0/255.0, green: 148.0/255.0, blue: 252.0/255.0, alpha: 1.0).CGColor
        styleLabel.layer.borderWidth = 1
        styleLabel.layer.masksToBounds = true
        styleLabel.layer.cornerRadius = 5
        styleLabel.text = "问答"
    }
    
    func showRecommendData(){
        titleLabel.text = recommend?.title!
        autoLabel.text = recommend?.author!.user_name!
        desLabel.text = recommend?.excerpt!
        
        styleLabel.layer.borderColor = UIColor(red: 13.0/255.0, green: 148.0/255.0, blue: 252.0/255.0, alpha: 1.0).CGColor
        styleLabel.layer.borderWidth = 1
        styleLabel.layer.masksToBounds = true
        styleLabel.layer.cornerRadius = 5
        styleLabel.text = "连载"

    }
    
    func showData(){
        titleLabel.text = model?.hp_title!
        autoLabel.text = model?.author![0].user_name!
        desLabel.text = model?.guide_word!
        
        styleLabel.layer.borderColor = UIColor(red: 13.0/255.0, green: 148.0/255.0, blue: 252.0/255.0, alpha: 1.0).CGColor
        styleLabel.layer.borderWidth = 1
        styleLabel.layer.masksToBounds = true
        styleLabel.layer.cornerRadius = 5
        styleLabel.text = "短篇"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //问题
    class func createQuestRecommendFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:QuestRecommendModel) -> ReadDetailRecommendCell {
        let cellId = "recommendCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReadDetailRecommendCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ReadDetailRecommendCell", owner: nil, options: nil).last as? ReadDetailRecommendCell
        }
        
        cell?.questRecommend = model.data![indexPath.row]
        return cell!
        
    }
    
    //短篇
    class func createReadDetailRecommendCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:ReadDetailRecommendModel) -> ReadDetailRecommendCell {
        let cellId = "recommendCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReadDetailRecommendCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ReadDetailRecommendCell", owner: nil, options: nil).last as? ReadDetailRecommendCell
        }
        
        cell?.model = model.data![indexPath.row]
        return cell!
        
    }
    //连载
    class func createReadSerialRecommendCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:ReadSerialRecommendModel) -> ReadDetailRecommendCell {
        let cellId = "recommendCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReadDetailRecommendCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ReadDetailRecommendCell", owner: nil, options: nil).last as? ReadDetailRecommendCell
        }
        
        cell?.recommend = model.data![indexPath.row]
        return cell!
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
