//
//  DetailViewController.swift
//  demo
//
//  Created by super华 on 2019/3/22.
//  Copyright © 2019年 supper 华. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    var url:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(add(_:)))
        
        //添加webView
        self.webView = WKWebView(frame: self.view.frame)
        self.view.addSubview(self.webView)
        self.webView.navigationDelegate = self
        
        let ur = URL(string: self.url)
        let request = URLRequest(url: ur!)
        self.webView.load(request)
        // Do any additional setup after loading the view.
    }
    // 展示模态框
    @objc func add(_ sender: AnyObject){
        let navigationController = UINavigationController(rootViewController: ModalViewController())
        self.present(navigationController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
