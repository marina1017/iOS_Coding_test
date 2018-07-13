//
//  VerticalStackView.swift
//  iOS_Coding_test
//
//  Created by 中川万莉奈 on 2018/07/13.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation
import UIKit

class VerticalStacView: UIStackView {
    let sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "注目の企業"
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "銀行"
        return label
    }()
    
    let view : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.addArrangedSubview(self.titleLabel)
        self.addArrangedSubview(self.sectionTitleLabel)
        self.addArrangedSubview(self.view)
    }
    
    override func updateConstraints() {
        
        //これは最後によぶ
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutTitleLabel()
        self.layoutTextFiled()
        self.layoutImageView()
    }
    
}
