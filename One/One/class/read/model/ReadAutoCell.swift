//
//  ReadAutoCell.swift
//  One
//
//  Created by 阳阳 on 16/8/29.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class ReadAutoCell: UITableViewCell {

    @IBOutlet weak var autoImageView: UIImageView!
    
    @IBOutlet weak var autoLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
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
    
    func showSerialData(){
        //头像
        autoImageView.layer.masksToBounds = true
        autoImageView.layer.cornerRadius = 20
        let url = NSURL(string: (serialModel?.author!.web_url)!)
        autoImageView.kf_setImageWithURL(url)
        
        autoLabel.text = serialModel?.author!.user_name!
        descLabel.text = "\((serialModel?.author!.desc)!)"
    
    }
    
    func showData(){
        //头像
        autoImageView.layer.masksToBounds = true
        autoImageView.layer.cornerRadius = 20
        let url = NSURL(string: (model?.author![0].web_url)!)
        autoImageView.kf_setImageWithURL(url)
        
        autoLabel.text = model?.author![0].user_name!
        descLabel.text = "\((model?.author![0].desc)!)\n\((model?.author![0].wb_name)!)"
    }
    
    //SerailCell
    class func createReadAutoCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:ReadDetailModel) -> ReadAutoCell {
        let cellId = "autoCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReadAutoCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ReadAutoCell", owner: nil, options: nil).last as? ReadAutoCell
        }
        
        cell?.model = model.data
        return cell!
        
    }
    
    class func createReadSerialAutoCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:ReadSerialModel) -> ReadAutoCell {
        let cellId = "autoCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReadAutoCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ReadAutoCell", owner: nil, options: nil).last as? ReadAutoCell
        }
        
        cell?.serialModel = model.data
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
