//
//  ReadDetailCell.swift
//  One
//
//  Created by 阳阳 on 16/8/26.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class ReadDetailCell: UITableViewCell {
    @IBOutlet weak var autoImageView: UIImageView!

    @IBOutlet weak var autoLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var desLabel: UILabel!
    
    @IBOutlet weak var bianjiLabel: UILabel!
    
    @IBOutlet weak var desHeight: NSLayoutConstraint!
    
    @IBOutlet weak var titleHeight: NSLayoutConstraint!
    
    @IBAction func playAction(sender: UIButton) {
    }
    
    
    var model:ReadDetailDataModel?{
        didSet{
            showData()
        }
    }
    
    var serialModel:ReadSerialDataModel?{
        didSet{
            showSerialData()
        }
    }
    //连载
    func showSerialData(){
       
        
        //头像
        autoImageView.layer.masksToBounds = true
        autoImageView.layer.cornerRadius = 20
        let url = NSURL(string: (serialModel?.author?.web_url)!)
        autoImageView.kf_setImageWithURL(url)
        
        //作者
        autoLabel.text = serialModel?.author?.user_name!
        //时间
        let str = NSString(string: (serialModel!.last_update_date)!)
        let array = str.componentsSeparatedByString(" ")
        self.timeLabel?.text = "\(array[0])"
        
        title.text = "收听"
        
        //标题
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFontOfSize(24)
        
        titleLabel.text = serialModel!.title!
        
        let titleH = MusicStoryCell.getLabHeigh(serialModel!.title!, font: UIFont.boldSystemFontOfSize(24), width: kSreenWith-10*2)
        titleHeight.constant = titleH
        
        let string = serialModel!.content!.stringByReplacingOccurrencesOfString("<br>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        desLabel.numberOfLines = 0
        //desLabel.backgroundColor = UIColor.redColor()
        desLabel.text = string
      
        
        //高度
        let desH:CGFloat = MusicStoryCell.getLabHeigh(string, font: UIFont.systemFontOfSize(17), width: kSreenWith-10*2)
    
        if desH > 5000{
            desHeight.constant = 5000
        }else{
            desHeight.constant = desH+10
        }
        
        
       bianjiLabel.text = serialModel!.charge_edt
        //print(serialModel?.last_update_name)
    }
    
    //短篇
    func showData(){
        //头像
        autoImageView.layer.masksToBounds = true
        autoImageView.layer.cornerRadius = 20
        let url = NSURL(string: (model?.author![0].web_url)!)
        autoImageView.kf_setImageWithURL(url)
        
        //作者
        autoLabel.text = model?.hp_author!
        //时间
        let str = NSString(string: (model!.last_update_date)!)
        let array = str.componentsSeparatedByString(" ")
        self.timeLabel?.text = "\(array[0])"
        
        title.text = "收听"
        
        titleLabel.font = UIFont.boldSystemFontOfSize(24)
        titleLabel.text = model?.hp_title!
        
        
        
        
        let string = model!.hp_content!.stringByReplacingOccurrencesOfString("<br>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        desLabel.numberOfLines = 0
        desLabel.text = string
        //desLabel.backgroundColor = UIColor.redColor()
        //高度
        let desH:CGFloat = MusicStoryCell.getLabHeigh(string, font: UIFont.systemFontOfSize(17), width: kSreenWith-10*2)
        //print(desH)
        if desH > 5000{
            desLabel.adjustsFontSizeToFitWidth=true
            desLabel.minimumScaleFactor = 0.8
            desHeight.constant = 5000
        }else{
            desHeight.constant = desH+10
        }
     
        bianjiLabel.text = model?.hp_author_introduce!
    }
    
    //计算Detailcell高度
    class func heightWithModel(model:ReadDetailModel?)->CGFloat{
        var h:CGFloat = 0
        //内容
        if model != nil{
            let w:CGFloat = kSreenWith-10*2
           
            let font = UIFont.systemFontOfSize(17)
            
            let str = model!.data!.hp_content!.stringByReplacingOccurrencesOfString("<br>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            let he = MusicStoryCell.getLabHeigh(str, font: font, width: w)
            if he>5000{
                h = 5000+190
            }else{
                h = he+190
            }
            
            
        }
        
        return h
        
    }
    
    //计算Serialcell高度
    class func heightWithSerialModel(model:ReadSerialModel?)->CGFloat{
        var h:CGFloat = 0
        //内容
        if model != nil{
            let w:CGFloat = kSreenWith-10*2
            
            let font = UIFont.systemFontOfSize(17)
            //print()
            let str = model?.data?.content!.stringByReplacingOccurrencesOfString("<br>", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            let titleH = MusicStoryCell.getLabHeigh(model!.data!.title!, font: UIFont.boldSystemFontOfSize(24), width: kSreenWith-10*2)
            let desH = MusicStoryCell.getLabHeigh(str!, font: font, width: w)
            //print(desH)
            if desH > 5000{
                h = 5000+titleH+150
            }else{
                 h = desH+titleH+150
            }
        }
        
        return h
        
    }
    
    //Detailcell
    class func createReadDetailCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:ReadDetailModel) -> ReadDetailCell {
        let cellId = "detailCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReadDetailCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ReadDetailCell", owner: nil, options: nil).last as? ReadDetailCell
        }
        
        cell?.model = model.data
        return cell!
    
    }
    //SerialCell
    class func createReadSerialCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:ReadSerialModel) -> ReadDetailCell {
        let cellId = "detailCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReadDetailCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ReadDetailCell", owner: nil, options: nil).last as? ReadDetailCell
        }
        
        cell?.serialModel = model.data
        return cell!
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
