//
//  EventCollectionVievCell.swift
//  demo
//
//  Created by super华 on 2019/3/14.
//  Copyright © 2019年 supper 华. All rights reserved.
//

import UIKit

class EventCollectionVievCell: UICollectionViewCell {
    var imgageView: UIImageView!
    var label: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        let cellwidth:CGFloat = self.frame.size.width
        
        //单元格的宽度
        let imageViewWidth:CGFloat = 101
        let imgageViewHeight:CGFloat = 101
        let imgageViewTopView:CGFloat = 15
        // 添加ImageView
        self.imgageView = UIImageView(frame: CGRect(x: (cellwidth - imageViewWidth)/2,y:imgageViewTopView, width: imageViewWidth, height: imgageViewHeight))
        self.addSubview(self.imgageView)
        
        
        // 添加标签
        let labelwidth:CGFloat = 101
        let labelheight:CGFloat = 16
        let labelTopView:CGFloat = 120

        self.label = UILabel(frame: CGRect(x:(cellwidth - labelwidth)/2,y:labelTopView, width: labelwidth, height: labelheight))
        // 字体左右居中
        self.label.textAlignment = .center
        //设置字体
        self.label.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(self.label)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("int(code:) has not been implemented")
    }
}
