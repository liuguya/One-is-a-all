//
//  NavViewController.swift
//  One
//
//  Created by 阳阳 on 16/8/15.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit

class NavViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //导航标题
    func addNavTitle(title: String) {
        
        let label = UILabel.createLabel(title, font: UIFont.boldSystemFontOfSize(24), textAlignment: .Center, textColor: UIColor.grayColor())
        label.frame = CGRectMake(80, 0, 215, 44)
        
        self.navigationItem.titleView = label
        
    }
    
    private func addNavBtn(title: String?,target: AnyObject, action: Selector,isLeft: Bool,bgImageName: String){
        //buttonbar_action
        
        let btn = UIButton.createButton(title, bgImageName: bgImageName, selectBgImageName: nil, target: target, action: action)
         btn.frame = CGRectMake(0, 4, 32, 32)
        
        let barBtnItem = UIBarButtonItem(customView: btn)
        if isLeft {
            self.navigationItem.leftBarButtonItem = barBtnItem
        }else{
            self.navigationItem.rightBarButtonItem = barBtnItem
        }
        
    }
    
    //返回按钮
    func addNavBackBtn() {
        
        self.addNavBtn("返回", target: self, action: #selector(backAction), isLeft: true, bgImageName: "")
        
    }
    func backAction(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //导航按钮
    func addNavBtn(target: AnyObject, action: Selector,isLeft: Bool,bgImageName:String){
        //buttonbar_action
        
        self.addNavBtn(nil, target: target, action: action, isLeft: isLeft, bgImageName: bgImageName)
        
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
