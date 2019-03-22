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
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建视图
        let screen = UIScreen.main.bounds
        
        //设置导航栏
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "单元格移动"
        
        self.listIteams = NSMutableArray(array:["黑龙江","吉林","辽宁","四川","广东","浙江","北京","云南"])
        
        
        //self.view.bounds
        var frame = CGRect(x:0,y:20, width: screen.size.width, height: screen.size.height - 20)
        // plain: 普通视图。      grouped: 分组视图 ---组的间距比较大
        self.tableView = UITableView (frame: frame, style: UITableViewStyle.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView.init()
        self.view.addSubview(self.tableView);
    }
    // UIViewController 生命周期方法，用于响应视图编辑状态变化
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: true)
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
    // 点击编辑按钮时，给每一行加图标，并转成对应的编辑模式，删除/新增/没有图标
    //如果移动的时候 不设置 .none,则默认会显示删除的
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    // 返回true 表示可以移动单元格
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    // 实现移动单元格
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //要移动的行
        let stringToMove = self.listIteams[(sourceIndexPath as NSIndexPath).row] as! String
        //删除原来的行
        self.listIteams.removeObject(at: (sourceIndexPath as NSIndexPath).row)
        //插入新的位置
        self.listIteams.insert(stringToMove, at: (destinationIndexPath as NSIndexPath).row)
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





























