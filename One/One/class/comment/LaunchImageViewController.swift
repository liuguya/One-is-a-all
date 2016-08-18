//
//  LaunchImageViewController.swift
//  One
//
//  Created by 阳阳 on 16/8/15.
//  Copyright © 2016年 liuguyang. All rights reserved.
//

import UIKit
// 引导页
class LaunchImageViewController: UIViewController,UIScrollViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
        self.view.addSubview(scrollView)
        //2.循环创建图片
        let w = scrollView.bounds.size.width
        let h = scrollView.bounds.size.height
        
        //创建滚动视图
        for i in 1...4{
            let bgImageView = UIImageView(frame: CGRectMake(CGFloat(i-1)*w, 0, w, h))
            bgImageView.image = UIImage.gifWithName("\(i)")
            scrollView.addSubview(bgImageView)
        }
        
        //设置滚动范围
        scrollView.contentSize = CGSizeMake(w*4, h)
        
        scrollView.tag = 200
        //按页滚动
        scrollView.pagingEnabled = true
        //设置代理
        scrollView.delegate = self
        
        //添加分页控件
        let pageCtrl = UIPageControl(frame: CGRectMake(140,440,80,40))
        pageCtrl.numberOfPages = 4
        pageCtrl.currentPage = 0
        //修改圆点的颜色
        pageCtrl.pageIndicatorTintColor = UIColor.greenColor()
        pageCtrl.currentPageIndicatorTintColor = UIColor.redColor()
        self.view.addSubview(pageCtrl)
        //设置tag值
        pageCtrl.tag = 300
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

extension LaunchImageViewController{
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.size.width)
        //分页控件
        let pageCtrl = self.view.viewWithTag(300) as! UIPageControl
        pageCtrl.currentPage = index
    }
}

