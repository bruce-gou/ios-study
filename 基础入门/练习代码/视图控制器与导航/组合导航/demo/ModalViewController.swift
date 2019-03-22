//
//  ModalViewController.swift
//  demo
//
//  Created by super华 on 2019/3/22.
//  Copyright © 2019年 supper 华. All rights reserved.
//

import UIKit
class ModalViewController: UIViewController {
    
    var txtUserName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建视图
        let screen = UIScreen.main.bounds
        self.view.backgroundColor = UIColor.white
        
        //设置导航栏
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel,target: self, action: #selector(back))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(back))
        self.navigationItem.title = "模态框"
        //label 标签
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: 70, height: 30))
        label.text = "用户ID"
        label.textAlignment = NSTextAlignment.right
        label.font = UIFont(name: "Arial-BoldMT", size: 14)
        self.view.addSubview(label)
        //输入框
        self.txtUserName = UITextField(frame: CGRect(x: 100, y: 100, width: 140, height: 30))
        self.txtUserName.borderStyle = UITextBorderStyle.roundedRect
        self.txtUserName.clearButtonMode = .whileEditing
        self.txtUserName.font = UIFont(name: "Arial-BoldMT", size: 14)
        self.view.addSubview(self.txtUserName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 返回-- 关闭模态框
    @objc func back(){
        self.dismiss(animated: true, completion: nil)
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
