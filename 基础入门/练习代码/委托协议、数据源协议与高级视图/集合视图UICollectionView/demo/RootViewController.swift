//
//  RootViewController.swift
//  demo
//
//  Created by super华 on 2019/3/6.
//  Copyright © 2019年 supper 华. All rights reserved.
//




import UIKit

//UIPickerView 的委托协议是 UIPickerViewDelegate，数据源是 UIPickerViewDataSource。我们需要在视图控制器中声明实现 UIPiekerViewDelegate 和 UIPickerViewDataSource 协议。
let COL_NUM = 3
class RootViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var label: UILabel!
    var nowClassName = [String]()
    var surplusClassName = [String]()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建视图
        let screen = UIScreen.main.bounds
        // 设置 根视图背景色
        self.view.backgroundColor = UIColor.white
        saveData()
        self.setupCollectionView()

    }
    // 添加数据
    private func saveData() {
        self.nowClassName += ["A-1","A-2","A-3","A-4","A-5","A-6","A-7","A-8","A-9","A-10","A-11"]
        self.surplusClassName += ["B-1","B-2","B-3","B-4","B-5","B-6","B-7","B-8","B-9","B-10","B-11"]
    }
    func setupCollectionView(){
        // 1.创建流式布局
        let layout = UICollectionViewFlowLayout()
        // 2.设置每个单元格的尺寸
        layout.itemSize = CGSize(width: 80, height: 80)
        // 3.设置整个collectionView的内边距
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 30, 15)
        
        let screenSize = UIScreen.main.bounds.size
        // 重新设置 iPhone 6/6s/7s/Plus
        if screenSize.height > 568 {
            layout.itemSize = CGSize(width: 100, height: 100)
            layout.sectionInset = UIEdgeInsetsMake(15, 15, 20, 15)
        }
        
        // 4.设置单元格之间的间距
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 30
        
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        //设置可重用单元格标识与单元格类型, 注册
        self.collectionView.register(EventCollectionVievCell.self, forCellWithReuseIdentifier: "cellIdentifiter")
        
        self.collectionView.backgroundColor = UIColor.white
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.view.addSubview(self.collectionView)
        
    }
    // UICollectionViewDataSource 数据协议 实现的方法回返回视图中节的个数 每个区的item个数
    //每个区的item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return self.nowClassName.count
        }else {
            return self.surplusClassName.count
        }
        
    }
    //分区个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    // 自定义cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 实现的方法法案后集合视图的单元格，单元格的获得采用可重用设计
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifiter", for: indexPath) as! EventCollectionVievCell
        if indexPath.section == 0 {
            cell.label.text = self.nowClassName[indexPath.item]
            cell.imgageView.image = UIImage(named: "3")
        }else{
            cell.label.text = self.surplusClassName[indexPath.item]
            cell.imgageView.image = UIImage(named: "4")
        }
        return cell
    }
    // UICollectionViewDelegate 委托协议，点击每个单元格
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(1111)
        if indexPath.section == 0 {
            print(self.nowClassName[indexPath.item])
        }else{
            print(self.surplusClassName[indexPath.item])
        }
    }
}





























