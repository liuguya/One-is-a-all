//
//  ReadTextCell.swift
//  One
//
//  Created by 阳阳 on 16/8/19.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class ReadTextCell: UITableViewCell {

    @IBOutlet weak var clickBtn: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var styleLabel: UILabel!
    
    
    @IBOutlet weak var autoLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
   
    @IBAction func clickAction(sender: UIButton) {
        print("11")
    }
    
    
    

    
    
    func showData(model:TextEssayModel){
        
        titleLabel.text = model.hp_title!
                print(model.hp_title!)
                styleLabel.text = "问答"
                autoLabel.numberOfLines = 0
                autoLabel.text = model.author![0].user_name!
                descLabel.numberOfLines = 0
                descLabel.text = model.guide_word!
                
        
        
    
    }
    
    
//    class func createReadTextCell(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:Array<TextEssayModel>) -> ReadTextCell {
//        let cellId = "textCellId"
//        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReadTextCell
//        if cell == nil {
//            cell = NSBundle.mainBundle().loadNibNamed("ReadTextCell", owner: nil, options: nil).last as? ReadTextCell
//        }
//    
//        cell?.model = model
//        return cell!
//        
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
