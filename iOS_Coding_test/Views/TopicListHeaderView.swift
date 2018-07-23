//
//  TopicListHeaderView.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/23.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import UIKit

class TopicListTableViewHeader: UITableViewHeaderFooterView {
    fileprivate var label = TopicListTableViewHeaderLabel()

    var title: String? {
        get {
            return self.label.text
        }
        set(newValue) {
            self.label.removeFromSuperview()
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            self.label.text = newValue ?? ""
            self.contentView.addSubview(self.label)
            self.label.frame = CGRect.init(x: Appearance.size.default,
                                           y: self.contentView.bounds.height / 2,
                                           width: self.contentView.bounds.width,
                                           height: self.contentView.bounds.height / 2)
        }
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.backgroundView = UIView(frame: self.bounds)
        self.backgroundView?.backgroundColor = UIColor.clear
        self.backgroundView?.isOpaque = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundView?.backgroundColor = UIColor.clear
    }
}

private class TopicListTableViewHeaderLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = Appearance.color.font
        self.font = Appearance.font.label(18, weight: .bold)
        self.textAlignment = .left
        self.isOpaque = true
        self.backgroundColor = UIColor.clear
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
