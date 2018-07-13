//
//  HorizontalStackView.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/13.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HorizontalStackView: UIStackView {
    let leftView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()

    let rightView : UIView = {
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
        self.addArrangedSubview(self.leftView)
        self.addArrangedSubview(self.rightView)
    }

    override func updateConstraints() {
        //これは最後によぶ
        super.updateConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutView()
    }

    private func layoutView() {
        self.leftView.snp.makeConstraints{ make in
            make.width.equalTo((self.superview?.frame.width)! / 3)
            make.height.equalToSuperview()
        }
        self.rightView.snp.makeConstraints{ make in
            make.width.equalTo((self.superview?.frame.width)! / 3)
            make.height.equalToSuperview()
        }
    }

    
}
