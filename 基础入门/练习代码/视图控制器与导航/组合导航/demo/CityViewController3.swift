//
//  CityViewController.swift
//  demo
//
//  Created by super华 on 2019/3/22.
//  Copyright © 2019年 supper 华. All rights reserved.
//

import UIKit

class CityViewController3: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var data: NSArray = ["贵阳","遵义","安顺","六盘水","赤水","兴义","兴仁","铜仁","清镇"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建视图
        let screen = UIScreen.main.bounds
        self.navigationItem.title = "贵州城市"
        // 设置 根视图背景色
        self.view.backgroundColor = UIColor.white
        // plain：普通表视图     grouped：分组表视图
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    //cell 个数，多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    // 每个cell 展示 的数据处理
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "CellIdentifier"
        // 实例化表视图对象
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil{
            //获得可重用单元格对象
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        // 填充 文本内容和 图标内容，可以用数组方式 ，根据 indexPath.row 的行数取得响应数组下标的内容进行填充
        cell?.textLabel?.text = self.data[indexPath.row] as! String  // 主标题
        //        cell?.detailTextLabel?.text = "这个是副标题" //副标题
        cell?.imageView?.image = UIImage(named: "3") //图标
        
        // 单元格 样式设置， 这个是 扩展指示图标，触摸该图标将切换到下一级表视图
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    // 设置cell 高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    //选中cell 执行此方法，做要做的操作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectName = self.data[indexPath.row] as! String
        let vc = DetailViewController()
        vc.title = selectName
        vc.url = "https://www.baidu.com/s?wd=%E8%B4%B5%E9%98%B3"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
