//
//  RootViewController.swift
//  demo
//
//  Created by super华 on 2019/3/6.
//  Copyright © 2019年 supper 华. All rights reserved.
//




import UIKit
class RootViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{
   //全部数据
    var txtField: UITextField!
    var listIteams: NSMutableArray!
    var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建视图
        let screen = UIScreen.main.bounds
        //设置导航栏
        self.navigationItem.title = "下拉刷新"
        
        self.listIteams = NSMutableArray(array:["黑龙江","吉林","辽宁","四川","广东","浙江","北京","云南"])
        
        //self.view.bounds
        var frame = CGRect(x:0,y:20, width: screen.size.width, height: screen.size.height - 20)
        // plain: 普通视图。      grouped: 分组视图 ---组的间距比较大
        self.tableView = UITableView (frame: frame, style: UITableViewStyle.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView.init()
        self.view.addSubview(self.tableView);
        
        
        // 初始化 UIRefreshControl()
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        self.refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        self.tableView.addSubview(self.refreshControl)
    }
     @objc func refreshTableView(){
        if self.refreshControl.isRefreshing == true {
            self.refreshControl.attributedTitle = NSAttributedString(string: "加载中...")
            //延时加载 3 秒
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                //添加新的模拟数据
                self.listIteams.insert("新增数据", at: 0)
                // 关闭刷新控件
                self.refreshControl.endRefreshing()
                self.refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
                //重新加载数据
                self.tableView.reloadData()
            }
        }
    }
//-------- 表视图 代理 -------
    //cell 个数，多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listIteams.count
    }
    // 每个cell 展示 的数据处理
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "CellIndexifier"
        // 实例化表视图对象
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellid)
        // 如果不是最后一行，则正常填充内容
        if cell == nil{
            //获得可重用单元格对象
            cell = UITableViewCell(style: .default, reuseIdentifier: cellid)
        }
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = self.listIteams[(indexPath as NSIndexPath).row] as? String
        return cell
    }
    // 设置cell 高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    //选中cell 执行此方法，做要做的操作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.listIteams[indexPath.row])
    }
}





























