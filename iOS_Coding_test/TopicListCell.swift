//
//  TopicListCell.swift
//  iOS_Coding_test
//
//  Created by 中川万莉奈 on 2018/07/12.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation
import UIKit

class TopicListCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
