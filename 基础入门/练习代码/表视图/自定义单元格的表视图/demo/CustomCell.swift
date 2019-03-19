//
//  CustomCell.swift
//  demo
//
//  Created by super华 on 2019/3/18.
//  Copyright © 2019年 supper 华. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    var myLabel: UILabel!
    var myImageView: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 单元格的高度
        let cellHeight: CGFloat = self.frame.size.height
        
        let imageViewWidth: CGFloat = 39
        let imageViewHeight: CGFloat = 28
        let imageViewLeftView: CGFloat = 300
        
        // 添加 ImageView
        self.myImageView = UIImageView(frame: CGRect(x: imageViewLeftView, y: (cellHeight - imageViewHeight)/2, width: imageViewWidth, height: imageViewHeight))
        
        self.addSubview(self.myImageView)
        
        //添加标签
        let labelwidth: CGFloat = 120
        let labelheight: CGFloat = 21
        let labelLeftView: CGFloat = 15
        
        self.myLabel = UILabel(frame: CGRect(x: labelLeftView, y:(cellHeight - labelheight)/2,width: labelwidth, height: labelheight))
        self.addSubview(self.myLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    
    
    
    
    
    
    
}
