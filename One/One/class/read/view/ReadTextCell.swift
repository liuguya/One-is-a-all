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
    
    
    var textModel:Array<TextEssayModel>?{
        didSet{
            showData1()
        }
    }
    
    var  textSerialArray:Array<TextSerialModel>?{
        didSet{
            showData2()
        }
    }
    
    var  textQuestionArray:Array<TextQuestionModel>?{
        didSet{
            showData3()
        }
    }
    
    
    
    
 
    
    func showData1(){
        //1.删除之前的子视图
       
        
        if textModel?.count > 0{
            let model = textModel![0]
            titleLabel.numberOfLines = 0
            titleLabel.text = model.hp_title!
            
            //print(model.hp_title)
//            styleLabel.text = "短篇"
            autoLabel.numberOfLines = 0
            autoLabel.text = model.author![0].user_name!
            descLabel.numberOfLines = 0
            descLabel.text = model.guide_word!
        
        }
    }
    
    func showData2(){
        //1.删除之前的子视图
     
        let model = textSerialArray![0]
        titleLabel.numberOfLines = 0
        titleLabel.text = model.title!
        let ma = model.author! 
        
        autoLabel.text = ma.user_name!
        descLabel.text = model.excerpt!
    }
    
    func showData3(){
        //1.删除之前的子视图
       
        let model = textQuestionArray![0]
        titleLabel.numberOfLines = 0
        titleLabel.text = model.question_title!
        autoLabel.text = model.answer_title!
        descLabel.text = model.answer_content!
    }
    
    
    class func createReadTextCell(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:ReadTextModel) -> ReadTextCell {
        let cellId = "textCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ReadTextCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ReadTextCell", owner: nil, options: nil).last as? ReadTextCell
        }
    
      
        cell?.styleLabel.layer.borderColor = UIColor(red: 13.0/255.0, green: 148.0/255.0, blue: 252.0/255.0, alpha: 1.0).CGColor
        cell?.styleLabel.layer.borderWidth = 1
        cell?.styleLabel.layer.masksToBounds = true
        cell?.styleLabel.layer.cornerRadius = 5
        if indexPath.row == 0{
            cell?.styleLabel.text = "全篇"
            cell!.textModel = model.data?.essay
        }else if indexPath.row == 1{
            cell?.styleLabel.text = "连载"
            cell!.textSerialArray = model.data?.serial
        }else{
            cell?.styleLabel.text = "问答"
            cell!.textQuestionArray = model.data?.question
        }
        
        
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
