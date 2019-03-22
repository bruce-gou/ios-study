//
//  RootViewController.swift
//  demo
//
//  Created by super华 on 2019/3/20.
//  Copyright © 2019年 supper 华. All rights reserved.
//

import UIKit
//屏幕宽度
let S_WIDTH = UIScreen.main.bounds.size.width
//屏幕高度
let S_HEIGHT = UIScreen.main.bounds.size.height

enum DirectionForWard: Int {
    case before = 1 //向前
    case after = 2 // 向后
}

class RootViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // 当前Page的索引
    var pageIndex = 0
    // 翻页的方向变量、其中 Before 表示向前翻，After 表示向后
    var directionForward = DirectionForWard.after
    
    var pageViewController: UIPageViewController!
    var viewControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建视图
        let screen = UIScreen.main.bounds
        self.view.backgroundColor = UIColor.white
        
        //设置导航栏
        //        self.navigationItem.rightBarButtonItem = self.editButtonItem
        //        self.navigationItem.title = "平铺导航"
        
        let page1ViewController = UIViewController()
        let page2ViewController = UIViewController()
        let page3ViewController = UIViewController()
        let page4ViewController = UIViewController()
        
        self.viewControllers = [page1ViewController, page2ViewController, page3ViewController, page4ViewController]
        
        let imageView1 = UIImageView(frame: self.view.frame)
        imageView1.image = UIImage(named: "Image-1")
        page1ViewController.view.addSubview(imageView1)
        
        let imageView2 = UIImageView(frame: self.view.frame)
        imageView2.image = UIImage(named: "Image-2")
        page2ViewController.view.addSubview(imageView2)
        
        let imageView3 = UIImageView(frame: self.view.frame)
        imageView3.image = UIImage(named: "Image-3")
        page3ViewController.view.addSubview(imageView3)
        
        let imageView4 = UIImageView(frame: self.view.frame)
        imageView4.image = UIImage(named: "Image-4")
        page4ViewController.view.addSubview(imageView4)
        
        
        //设置UIPageViewController 控制器 transitionStyle：设定页面翻转样式 .pageCurl 翻书效果样式， .scroll 滑屏效果样式
        //navigationOrientation: 设定翻页方向，.horizontal: 水平方向， .vertical: 垂直方向
        self.pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.pageCurl, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: nil)
        // 代理
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
        
        //设置首页--- 如果书脊是 min 或者max ，首页中将显示一个视图，如果 是mid ，首页中会显示2个视图
        //direction: 翻页动画方向，.forward: 向前， .reverse: 向后
        self.pageViewController.setViewControllers([page1ViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
        self.view.addSubview(self.pageViewController.view)
        
       
        
        
        
    }
    
    //MARK -- 实现 UIPageViewControllerDataSource 协议
    // 向后
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        pageIndex += 1
        if pageIndex > 3 {
            pageIndex = 3
            return nil
        }
        directionForward = .after
        return self.viewControllers[pageIndex]
    }
    // 向前
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        pageIndex -= 1
        if pageIndex < 0 {
            pageIndex = 0
            return nil
        }
        directionForward = .before
        return self.viewControllers[pageIndex]
    }
    
    // MARK -- 实现 UIPageViewControllerDelegate 协议
    // 设定书脊
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        self.pageViewController.isDoubleSided = false
        return .min
    }
    // 翻页动作完成后触发的,可以利用这个方法判断用户是否成功翻到了下一页
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed == false {
            if directionForward == .after {
                pageIndex -= 1
            }
            if directionForward == .before {
                pageIndex += 1
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
