//
//  TopicContentView.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/14.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import UIKit

class TopicContentView : UICollectionViewCell {
    let topicTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "自動運転"
        label.font = Appearance.font.label(15, weight: .semibold)
        label.textColor = Appearance.color.font
        return label
    }()

    let followUpLabel: UILabel = {
        let label = UILabel()
        label.text = "100人がフォロー"
        label.font = Appearance.font.label(10, weight: .light)
        label.textColor = Appearance.color.font
        return label
    }()

    let checkView: UIView = {
        let checkView = UIView()
        checkView.isUserInteractionEnabled = false
        return checkView
    }()

    var isSelectedCell: Bool = false


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10.0
        self.backgroundColor = Appearance.color.background
        self.commonInit()
        self.setStyle()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {

        self.addSubview(self.topicTitleLabel)
        self.addSubview(self.followUpLabel)
        self.addSubview(self.checkView)
    }

    func setStyle() {
        let checkMark: UIImage?
        print("self.isSelected",self.isSelected)
        if self.isSelectedCell {
            checkMark = UIImage(named:"checkButton")!
        } else {
            checkMark = UIImage(named:"emptyButton")!
        }
        let displayIcon = UIImageView(image: checkMark)
        self.checkView.addSubview(displayIcon)
        displayIcon.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }

    override func updateConstraints() {

        //これは最後によぶ
        super.updateConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutTitleLabel()
        self.layoutFollowUpLabel()
        self.layoutCheckView()
    }

    private func layoutTitleLabel() {
        self.topicTitleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Appearance.size.small)
            make.left.equalToSuperview().offset(Appearance.size.small)
            make.right.equalToSuperview()
            make.bottom.equalTo(self.followUpLabel.snp.top)
        }
    }

    private func layoutFollowUpLabel() {
        self.followUpLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.topicTitleLabel.snp.bottom)
            make.height.equalTo(Appearance.size.extraLarge)
            make.left.equalToSuperview().offset(Appearance.size.small)
            make.right.equalToSuperview()
        }
    }

    private func layoutCheckView() {
        self.checkView.snp.makeConstraints{ make in
            make.height.equalTo(Appearance.size.default)
            make.width.equalTo(Appearance.size.default)
            make.right.equalToSuperview().offset(-Appearance.size.small)
            make.bottom.equalToSuperview().offset(-Appearance.size.small)
        }
    }

}
