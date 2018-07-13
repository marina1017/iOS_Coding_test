//
//  TopicListCell.swift
//  iOS_Coding_test
//
//  Created by 中川万莉奈 on 2018/07/12.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class TopicListCell: UITableViewCell {

    var cellContentView: VerticalStacView = {
        let stackView = VerticalStacView(frame: CGRect.zero)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.accessoryType = .none
        self.layoutMargins = UIEdgeInsets.zero
        self.separatorInset = UIEdgeInsets.zero
        self.clipsToBounds = true
        self.addSubview(self.cellContentView)
        self.cellContentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Appearance.margin.small)
            make.left.equalToSuperview().offset(Appearance.margin.small)
            make.right.equalToSuperview().offset(-Appearance.margin.small)
            make.bottom.equalToSuperview().offset(-Appearance.margin.small)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
