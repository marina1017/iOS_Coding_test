//
//  SectionHeader.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/16.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import UIKit
import SnapKit

final class SectionHeaderView: UICollectionReusableView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "銀行"
        label.font = Appearance.font.label(16, weight: .light)
        label.textColor = Appearance.color.font
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }

    private func commonInit() {
        self.addSubview(self.titleLabel)
    }
    
    override func updateConstraints() {

        //これは最後によぶ
        super.updateConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutTitleLabel()
    }

    private func layoutTitleLabel() {
        self.titleLabel.sizeToFit()
        self.titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(Appearance.size.default)
        }
    }
}
