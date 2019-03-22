//
//  JiViewController.swift
//  demo
//
//  Created by super华 on 2019/3/22.
//  Copyright © 2019年 supper 华. All rights reserved.
//

import UIKit

class JiViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建视图
        let screen = UIScreen.main.bounds
        self.view.backgroundColor = UIColor.white
        
        
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "Image-2")
        
        self.view.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
