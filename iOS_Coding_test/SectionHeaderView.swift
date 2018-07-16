//
//  SectionHeader.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/16.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

import UIKit
import SnapKit

final class SectionHeaderView: UICollectionReusableView {
    let sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "注目の企業"
        label.font = Appearance.font.label(18, weight: .bold)
        label.textColor = Appearance.color.font
        return label
    }()

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
        self.addSubview(self.sectionTitleLabel)
        self.addSubview(self.titleLabel)
    }
    override func updateConstraints() {

        //これは最後によぶ
        super.updateConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutSectionTitleLabel()
        self.layoutTitleLabel()
    }

    private func layoutSectionTitleLabel() {
        self.sectionTitleLabel.sizeToFit()
        self.sectionTitleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.left.equalToSuperview().offset(Appearance.size.default)
            make.height.equalTo(Appearance.size.default)
            make.bottom.equalTo(self.titleLabel.snp.top)
        }
    }

    private func layoutTitleLabel() {
        self.titleLabel.sizeToFit()
        self.titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.sectionTitleLabel.snp.bottom)
            make.left.equalToSuperview().offset(Appearance.size.default)
            make.width.equalToSuperview()
            make.height.equalTo(Appearance.size.default)
        }
    }
}
