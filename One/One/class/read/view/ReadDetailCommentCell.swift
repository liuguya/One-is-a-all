//
//  ReadDetailCommentCell.swift
//  One
//
//  Created by 阳阳 on 16/8/29.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class ReadDetailCommentCell: UITableViewCell {

    @IBOutlet weak var autoImageView: UIImageView!
   
    @IBOutlet weak var autoLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var loveLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var descHeight: NSLayoutConstraint!
    
    @IBAction func loveAction(sender: UIButton) {
    }
    
    
    var model:ReadDetailCommentSubjectModel?{
        didSet{
            showData()
        }
    }
    
    func showData(){
        //头像
        autoImageView.layer.masksToBounds = true
        autoImageView.layer.cornerRadius = 20
        let url = NSURL(string: (model?.user?.web_url)!)
        autoImageView.kf_setImageWithURL(url)
        
        //作者
        autoLabel.text = model?.user?.user_name!
        //时间
        let str = NSString(string: (model?.input_date)!)
        let array = str.componentsSeparatedByString(" ")
        self.timeLabel?.text = "\(array[0])"
        
        //点赞
        loveLabel.text = "\((model?.praisenum)!)"
        //内容
        let desc = model?.content!
        //高度
        let desH:CGFloat = MusicStoryCell.getLabHeigh(desc!, font: UIFont.systemFontOfSize(17), width: kSreenWith-10*2)
        descHeight.constant = desH+10
        descLabel.numberOfLines = 0
        descLabel.text = desc
    }
    
    
   class func createReadCommentCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:ReadDetailCommentModel) -> ReadDetailCommentCell {
        let cellId = "commentCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReadDetailCommentCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ReadDetailCommentCell", owner: nil, options: nil).last as? ReadDetailCommentCell
        }
        
        cell?.model = model.data?.data![indexPath.row]
        return cell!
        
    }
    
    //计算高度
    class func heightWithComment(model:ReadDetailCommentSubjectModel)->CGFloat{
        //内容
        let desc = model.content!
        //高度
        let desH:CGFloat = MusicStoryCell.getLabHeigh(desc, font: UIFont.systemFontOfSize(17), width: kSreenWith-10*2)
        let height:CGFloat = desH + 110
        return height
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
