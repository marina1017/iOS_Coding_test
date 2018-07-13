//
//  VerticalStackView.swift
//  iOS_Coding_test
//
//  Created by 中川万莉奈 on 2018/07/13.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

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

    var horizontalStackView: HorizontalStackView = {
        let stackView = HorizontalStackView(frame: CGRect.zero)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        self.addArrangedSubview(self.sectionTitleLabel)
        self.addArrangedSubview(self.titleLabel)
        self.addArrangedSubview(self.horizontalStackView)
    }
    
    override func updateConstraints() {
        
        //これは最後によぶ
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutSectionTitleLabel()
        self.layoutTitleLabel()
        self.layoutView()
    }

    private func layoutSectionTitleLabel() {
        self.sectionTitleLabel.sizeToFit()
        self.sectionTitleLabel.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(Appearance.size.default)
        }
    }

    private func layoutTitleLabel() {
        self.titleLabel.sizeToFit()
        self.titleLabel.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(Appearance.size.default)
        }
    }

    private func layoutView() {
        self.horizontalStackView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(Appearance.size.default)
        }
    }


    
}
