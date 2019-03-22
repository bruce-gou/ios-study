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


class RootViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    
    var imageView1: UIImageView!
    var imageView2: UIImageView!
    var imageView3: UIImageView!
    var imageView4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建视图
        let screen = UIScreen.main.bounds
        self.view.backgroundColor = UIColor.white
        //设置导航栏
        //        self.navigationItem.rightBarButtonItem = self.editButtonItem
//        self.navigationItem.title = "平铺导航"
        
        self.scrollView = UIScrollView()
        self.scrollView.frame = self.view.frame
        // 每次滚动一整屏 --> 水平滚动
        self.scrollView.isPagingEnabled = true
        // 用于设置水平滚动条不显示
        self.scrollView.showsHorizontalScrollIndicator = false
        // 设置垂直滚动条不显示
        self.scrollView.showsVerticalScrollIndicator = false
        // 反弹效果
        self.scrollView.bounces = true
        // 设置代理
        self.scrollView.delegate = self
        
        //视图滚动的大小
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * 4, height: self.scrollView.frame.size.height)
        //添加图片视图
        self.imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: S_WIDTH, height: S_HEIGHT))
        self.imageView1.image = UIImage(named: "Image-1")
        self.imageView2 = UIImageView(frame: CGRect(x: S_WIDTH, y: 0, width: S_WIDTH, height: S_HEIGHT))
        self.imageView2.image = UIImage(named: "Image-2")
        self.imageView3 = UIImageView(frame: CGRect(x: S_WIDTH * 2, y: 0, width: S_WIDTH, height: S_HEIGHT))
        self.imageView3.image = UIImage(named: "Image-3")
        self.imageView4 = UIImageView(frame: CGRect(x: S_WIDTH * 3, y: 0, width: S_WIDTH, height: S_HEIGHT))
        self.imageView4.image = UIImage(named: "Image-4")
    
        
        self.scrollView.addSubview(self.imageView1)
        self.scrollView.addSubview(self.imageView2)
        self.scrollView.addSubview(self.imageView3)
        self.scrollView.addSubview(self.imageView4)
        
         self.view.addSubview(self.scrollView)
        
        let pageControlWidth: CGFloat = 300
        let pageControlHeight: CGFloat = 37
        // 创建分屏控件
        self.pageControl = UIPageControl(frame: CGRect(x: ( S_WIDTH - pageControlWidth)/2,y: S_HEIGHT - pageControlHeight, width: pageControlWidth, height: pageControlHeight))
        // 设置总屏数属性值为4
        self.pageControl.numberOfPages = 4
        self.pageControl.addTarget(self, action: #selector(changePage(_:)), for: .valueChanged)
        self.view.addSubview(self.pageControl)
        
        
        
    }
    // MARK --- 实现UIScrollerViewDelegate 委托协议--- 滚动视图的响应方法
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        // 根据滚动的偏移差，给分页控件 当前分页页码
        self.pageControl.currentPage = Int(offset.x / S_WIDTH)
    }
    // 实现UIPageControl 事件处理--- 点击分页控件的响应
    @IBAction func changePage(_ pageControl: UIPageControl){
        UIView.animate(withDuration: 0.3, animations: {
            let page = pageControl.currentPage
            self.scrollView.contentOffset = CGPoint(x: S_WIDTH * CGFloat(page), y: 0)
        })
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("将要开始拖动")
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("停止拖动")
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("正在缩放")
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("已经缩放完毕")
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
