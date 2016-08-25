//
//  HomeViewController.swift
//  One
//
//  Created by 阳阳 on 16/8/15.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController{
    var imageView:UIImageView?
    var showImageView:UIImageView?
    var maskView:UIView?
    var isType:Bool?
    
    //简介
    var desLabel:UILabel?
    
    //作者
    var autoLabel:UILabel?
    
    var label:UILabel?
    
    //时间
    var timeLabel:UILabel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置导航
        createHomeNav()
        //下载数据
        createDownloder()
        
        //创建首页视图
        createHomeView()
   
    }
    //设置导航
    func createHomeNav(){
        self.addNavTitle("ONE")
        self.view.backgroundColor = UIColor.whiteColor()
        //按钮
        addNavBtn(self, action: #selector(searchAction), isLeft: true, bgImageName: "fangfajin")
        
        addNavBtn(self, action: #selector(personAction), isLeft: false, bgImageName: "person")
    }
    
    //搜索
    func searchAction(){
    
    }
    
    //个人
    func personAction(){}
    
    //创建首页视图
    func createHomeView(){
        //创建视图
        let vi = UIView.createShareView()
        self.view.addSubview(vi)
        //添加约束
        vi.snp_makeConstraints {
            [weak self]
            (make) in
            make.left.equalTo(self!.view).offset(20)
            make.right.equalTo(self!.view).offset(-20)
            make.top.equalTo(self!.view).offset(80)
            make.bottom.equalTo(self!.view).offset(-200)
        }
        
        //创建图片按钮
        self.imageView = UIImageView()
        self.imageView?.image = UIImage(named: "bg.png")
        //开启图片的交互
        self.imageView?.userInteractionEnabled = true
        //添加手势
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageTouch))
        imageView! .addGestureRecognizer(singleTap)
        self.isType = true
        vi.addSubview(imageView!)
        //添加约束
        imageView?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(vi.snp_left).offset(10)
            make.right.equalTo(vi.snp_right).offset(-10)
            make.top.equalTo(vi.snp_top).offset(10)
            make.bottom.equalTo(vi.snp_bottom).offset(-150)
        })
        
        let label = UILabel.createLabel(nil, font: UIFont.systemFontOfSize(13), textAlignment: .Center, textColor: UIColor.grayColor())
        view.addSubview(label)
        label.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(vi.snp_left).offset(10)
            make.top.equalTo((self.imageView?.snp_bottom)!).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(20)
        })
        self.label = label
        
        //作者
        autoLabel = UILabel.createLabel(nil, font: UIFont.systemFontOfSize(13), textAlignment: .Center, textColor: UIColor.grayColor())
        view.addSubview(autoLabel!)
        //约束
        autoLabel!.snp_makeConstraints(closure: { (make) in
            make.right.equalTo(10)
            make.top.equalTo((self.imageView?.snp_bottom)!).offset(10)
            
            make.width.equalTo(200)
            make.height.equalTo(20)
        })
        
        //简介
        desLabel = UILabel.createLabel(nil, font: UIFont.systemFontOfSize(13), textAlignment: .Left, textColor: UIColor.blackColor())
        desLabel?.numberOfLines = 0
        view.addSubview(desLabel!)
        //约束
        desLabel!.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(vi.snp_left).offset(10)
            make.right.equalTo(vi.snp_right).offset(-10)
            make.bottom.equalTo(vi.snp_bottom).offset(-50)
        })
        
        //图片
        let worldImage = UIImageView.createImageView("world")
        view.addSubview(worldImage)
        //约束
        worldImage.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(vi.snp_left).offset(150)
            make.bottom.equalTo(vi.snp_bottom).offset(-10)
            make.width.equalTo(15)
            make.height.equalTo(15)
        })
        
        //时间
        timeLabel = UILabel.createLabel(nil, font: UIFont.systemFontOfSize(13), textAlignment: .Left, textColor: UIColor.grayColor())
        view.addSubview(timeLabel!)
        //约束
        timeLabel!.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(vi.snp_left).offset(180)
            make.bottom.equalTo(vi.snp_bottom).offset(-10)
            make.width.equalTo(200)
            make.height.equalTo(15)
        })
        
        //图标
        let btn = UIButton.createButton(nil, bgImageName: "book", selectBgImageName: nil, target: self, action: #selector(clickAction))
        view.addSubview(btn)
        //约束
        btn.snp_makeConstraints { (make) in
            make.left.equalTo(vi)
            make.top.equalTo(vi.snp_bottom).offset(10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        //btn2 = 
        let btn2 = UIButton.createButton("小 记", bgImageName: nil, selectBgImageName: nil, target: self, action: #selector(clickAction))
        btn2.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
        btn2.setTitleColor(UIColor.grayColor(), forState: .Normal)
         view.addSubview(btn2)
        btn2.snp_makeConstraints { (make) in
            make.left.equalTo(btn.snp_right).offset(5)
            make.top.equalTo(vi.snp_bottom).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
    }
    
    
    
    //点击图片放大
    func imageTouch(){
        if self.isType == true{
            
            
            self.navigationController?.navigationBar.alpha = 0.5
            self.tabBarController?.tabBar.alpha = 0.2
            self.maskView = UIView(frame: UIScreen.mainScreen().bounds)
            self.maskView?.backgroundColor = UIColor.blackColor()
            self.maskView?.alpha = 0.5
            self.view.addSubview(self.maskView!)
           
            
            //创建全屏显示
            self.showImageView = UIImageView()
            self.showImageView?.image = self.imageView?.image
            //添加手势
            
            
            
            self.showImageView?.userInteractionEnabled = true
            
            self.view.addSubview(showImageView!)
                    //添加约束
            showImageView!.snp_makeConstraints {
                [weak self]
                (make) in
                make.left.equalTo(self!.view).offset(20)
                make.right.equalTo(self!.view).offset(-20)
                make.top.equalTo(self!.view).offset(200)
                make.bottom.equalTo(self!.view).offset(-200)
            }
            
            //添加手势
            let singleTap = UITapGestureRecognizer(target: self, action: #selector(imageTouch))
            self.maskView! .addGestureRecognizer(singleTap)
            isType = false
        }else{
            self.navigationController?.navigationBar.alpha = 1.0
            self.tabBarController?.tabBar.alpha = 1.0
            self.maskView?.removeFromSuperview()
            self.showImageView?.removeFromSuperview()
            isType = true
            
            //print("3")
        }
        
    }
    
        //点击
    func clickAction(){
    
    }
    
   
    
    //下载数据
    func createDownloder(){
        let download = Download()
        download.delegate = self
        download.getWithUrl(homeUrl)
    }
    
    //显示数据
    func showHome(model:HomeModel){
        let imageUrl = NSURL(string: model.hp_img_url!)
        self.imageView?.kf_setImageWithURL(imageUrl)
        self.showImageView?.kf_setImageWithURL(imageUrl)
        self.label?.text = model.hp_title!
        self.autoLabel?.text = model.hp_author!
        self.desLabel?.text = model.hp_content!
        
        let str = NSString(string: (model.hp_makettime)!)
        let array = str.componentsSeparatedByString(" ")
        
        self.timeLabel?.text = "X.C地球 \(array[0])"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK:下载数据
extension HomeViewController:DownloadDelegate{
    func downloader(downloader: Download, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: Download, didFinishWithData data: NSData?) {
        let jsonData = try!  NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
        
        if jsonData.isKindOfClass(NSDictionary) {
            let dict = jsonData as! NSDictionary
            let apps = dict["data"] as! Array<Dictionary<String,AnyObject>>
            for appDict in 0..<apps.count {
                //创建模型对象
                if appDict == 0{
                    let model = HomeModel()
                    model.setValuesForKeysWithDictionary(apps[appDict])
                    
                    self.showHome(model)
                }
                
            }
            
        }

    }
    
    }
