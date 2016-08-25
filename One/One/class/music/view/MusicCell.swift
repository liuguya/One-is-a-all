//
//  MusicCell.swift
//  One
//
//  Created by 阳阳 on 16/8/22.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
import AVFoundation




class MusicCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var autoImage: UIImageView!
    
    @IBOutlet weak var musicLabel: UILabel!
    
    @IBOutlet weak var autoLabel: UILabel!
    
    @IBOutlet weak var musicNameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBAction func playAction(sender: UIButton) {
        if (self.player) == nil {
            let url=NSURL(string:(dataModel?.music_id)!)
            let data = NSData(contentsOfURL: url!)
            player = try! AVAudioPlayer(data: data!, fileTypeHint: nil)
            player!.prepareToPlay()
            player!.play()
        }else{
            self.player?.stop()
            
            //释放之前的播放对象
            self.player?.currentTime = 0
            self.player = nil
        }
        
        
    }
  
    

    @IBAction func clickAction(sender: UIButton) {
       
            
        
        
        
    }
    
    
    //创建音乐播放器
    var player:AVAudioPlayer?
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    
     var audioPlayer: AVAudioPlayer?
    var dataModel:MusicDataModel?{
        didSet{
            showData()
        
        }
    }
    
    func showData(){
      
        //图片
        let url = NSURL(string: (dataModel?.cover!)!)
        bgImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "bg"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        //背景
        bgView.backgroundColor = UIColor.whiteColor()
        bgView.layer.borderColor = UIColor(white: 0.1, alpha: 0.1).CGColor
        bgView.layer.borderWidth = 2
        bgView.layer.masksToBounds = true
        bgView.layer.cornerRadius = 10
        
        
   
        
        //作者标题
        autoLabel.text = dataModel?.author?.user_name
        //音乐名称
        musicNameLabel.text = dataModel?.author?.desc
        //作者头像
        autoImage.layer.masksToBounds = true
        autoImage.layer.cornerRadius = 20
        let url2 = NSURL(string: (dataModel?.author?.web_url!)!)
        autoImage.kf_setImageWithURL(url2, placeholderImage: UIImage(named: "bg"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        //标题
        musicLabel.text = dataModel?.title!
     
        
        timeLabel.text = dataModel?.maketime!
        
    }
    
    
   
    
    
    class func createMusicCell(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withModel model:MusicDataModel) -> MusicCell {
        let cellId = "musicCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? MusicCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("MusicCell", owner: nil, options: nil).last as? MusicCell
        }
        
        cell?.dataModel = model
        return cell!
        
    }
    
 

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


