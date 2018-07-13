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
    let leftView : TopicContentView = {
        let view = TopicContentView()
        view.isUserInteractionEnabled = true
        view.isSelected = false
        return view
    }()

    let rightView : TopicContentView = {
        let view = TopicContentView()
        view.backgroundColor = Appearance.color.background
        view.isUserInteractionEnabled = true
        view.isSelected = false
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
        self.leftView.addTarget(self,
                         action: #selector(HorizontalStackView.leftViewButtonTapped(sender:)),
                         for: .touchUpInside)
        self.rightView.addTarget(self,
                                action: #selector(HorizontalStackView.rightViewButtonTapped(sender:)),
                                for: .touchUpInside)
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

    @objc func leftViewButtonTapped(sender : AnyObject) {
        self.leftView.isSelected = self.leftView.isSelected == true ? false : true
    }

    @objc func rightViewButtonTapped(sender : AnyObject) {
        self.rightView.isSelected = self.rightView.isSelected == true ? false : true
    }

}
