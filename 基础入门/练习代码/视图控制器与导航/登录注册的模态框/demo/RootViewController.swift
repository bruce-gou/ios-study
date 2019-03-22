//
//  RootViewController.swift
//  demo
//
//  Created by super华 on 2019/3/20.
//  Copyright © 2019年 supper 华. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    var userNameTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建视图
        let screen = UIScreen.main.bounds
        self.view.backgroundColor = UIColor.white
        //设置导航栏
        //        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "登录"
        
        var frame = CGRect(x: 0, y: 100, width: 70, height: 30)
        creatLabel(frame: frame, txt: "用户名")
        frame = CGRect(x: 0, y: 150, width: 70, height: 30)
        creatLabel(frame: frame, txt: "密码")
        
        
        frame = CGRect(x: 100, y: 100, width: 140, height: 30)
        creatTextFiled(frame, flg: true)
        frame = CGRect(x: 100, y: 150, width: 140, height: 30)
        creatTextFiled(frame, flg: false)
        
        frame = CGRect(x: 130, y: 220, width: 80, height: 30)
        creatButton(frame: frame, txt: "登录", flg: false)
        frame = CGRect(x: 130, y: 260, width: 80, height: 30)
        creatButton(frame: frame, txt: "注册", flg: true)
        
        //接收注册页面传来 的参数
        NotificationCenter.default.addObserver(self, selector: #selector(registerCompletion), name: NSNotification.Name(rawValue: "RegisterCompletionNotification"), object: nil)
    }
    //创建label
    func creatLabel(frame: CGRect, txt: String){
        let label = UILabel(frame: frame)
        label.text = txt
        label.textAlignment = NSTextAlignment.right
        label.font = UIFont(name: "Arial-BoldMT", size: 14)
        self.view.addSubview(label)
    }
    //创建输入框
    func creatTextFiled(_ frame: CGRect, flg: Bool){
        let txtFiled = UITextField(frame: frame)
        txtFiled.borderStyle = UITextBorderStyle.roundedRect
        txtFiled.clearButtonMode = .whileEditing
        txtFiled.font = UIFont(name: "Arial-BoldMT", size: 14)
        if flg {
            self.userNameTxtField = txtFiled
            self.view.addSubview(self.userNameTxtField)
        }else{
            self.view.addSubview(txtFiled)
        }
    }
    // 创建button
    func creatButton(frame: CGRect, txt: String, flg: Bool){
        let button = UIButton(type: UIButtonType.system)
        button.frame = frame
        button.setTitle(txt, for: UIControlState.normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        if flg {
            button.addTarget(self, action: #selector(register), for: UIControlEvents.touchUpInside)
        }
        self.view.addSubview(button)
    }
    // 组册
    @objc func register(){
        let register = RegisterViewController()
        let navigationController = UINavigationController(rootViewController: register)
        // 打开模态框
        self.present(navigationController, animated: true, completion: nil)
    }
    //接收参数
    @objc func registerCompletion(notification: Notification){
        let theData = notification.userInfo as! NSDictionary
        //放入用户名的输入框
        self.userNameTxtField.text = theData["userName"] as! String
        print("username = ", theData["userName"])
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //移除监听
        NotificationCenter.default.removeObserver(self)
        // Dispose of any resources that can be recreated.
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
