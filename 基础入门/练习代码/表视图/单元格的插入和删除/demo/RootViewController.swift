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
        self.navigationItem.title = "单元格插入和删除"
        
        //设置单元格文本框
        self.txtField = UITextField()
        self.txtField.isHidden = true
        self.txtField.delegate = self
        
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
        // 当视图能够编辑的时候，输入框展示出来
        if editing {
            self.txtField.isHidden = false
        }else{
            self.txtField.isHidden = true
        }
    }
    
//-------- 表视图 代理 -------
    //cell 个数，多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listIteams.count + 1
    }
    // 每个cell 展示 的数据处理
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "CellIndexifier"
        let b_addCell = ((indexPath as NSIndexPath).row == self.listIteams.count)
        // 实例化表视图对象
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellid)
        // 最后多出的一行--- 添加行，没有内容
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellid)
        }
        // 如果不是最后一行，则正常填充内容
        if !b_addCell{
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = self.listIteams[(indexPath as NSIndexPath).row] as? String
        }else{
            //是最后一行，添加输入框
            self.txtField.frame = CGRect(x: 40, y: 0, width: 300, height: cell.frame.size.height)
            self.txtField.borderStyle = .none
            self.txtField.placeholder = "ADD..."
            self.txtField.text = ""
            cell.addSubview(self.txtField)
        }
        return cell
    }
    // 点击编辑按钮时，给每一行加图标，并转成对应的编辑模式，删除/新增
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if ((indexPath as NSIndexPath).row == self.listIteams.count){
            return UITableViewCellEditingStyle.insert
        }else{
            return UITableViewCellEditingStyle.delete
        }
    }
    // 设置确认删除按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "确认删除"
    }
    // 点击删除或者添加按钮后对数据 和视图的 操作,然后更新视图
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print(editingStyle == UITableViewCellEditingStyle.delete)

        let indexPaths = [indexPath]
        if editingStyle == UITableViewCellEditingStyle.delete{
            // 删除数据
            self.listIteams.removeObject(at: (indexPath as NSIndexPath).row)
            //删除视图
            self.tableView.deleteRows(at: indexPaths, with: .fade)
        }else if editingStyle == UITableViewCellEditingStyle.insert{
            //插入数据
            self.listIteams.insert(self.txtField.text!, at: self.listIteams.count)
            //插入到视图
            self.tableView.insertRows(at: indexPaths, with: .fade)
        }
        self.tableView.reloadData()
    }
    // 设置正常情况不可选择的行 true: 可选择， false: 不可选择
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        // 这里是控制 ，最后多的一行不与选择
        if indexPath.row == self.listIteams.count {
            return false
        }else{
            return true
        }
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





























