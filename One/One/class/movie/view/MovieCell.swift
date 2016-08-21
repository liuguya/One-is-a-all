//
//  MovieCell.swift
//  One
//
//  Created by 阳阳 on 16/8/17.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configModel(model:MovieModel){
        //print(model.cover!)
        let url = NSURL(string: model.cover!)
        let image = UIImage(named: "bg")
        ImageView.kf_setImageWithURL(url, placeholderImage: image, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        //print(model.scoretime)
        if model.score == nil{
            label.text = "即将上映"
            label.font = UIFont.systemFontOfSize(15)
            label.textColor = UIColor.blackColor()
            label.transform = CGAffineTransformMakeRotation(0)
        }else{
            label.text = "\((model.score)!)"
            label.textColor = UIColor.redColor()
            label.font = UIFont(name: "Bradley Hand", size: 50)
            label.transform = CGAffineTransformMakeRotation(-0.5)
        }
        
        //label.transform = CGAffineTransformMakeRotation(-0.2)
        
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
