//
//  TopicListTableView.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/23.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import UIKit

class TopicListTableView: UITableView {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.initTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func initTableView() {
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = UIColor.clear
        self.estimatedRowHeight = 0
        // セルをテーブルに紐付ける
        self.register(TopicListCell.self, forCellReuseIdentifier: NSStringFromClass(TopicListCell.self))
        self.register(TopicListTableViewHeader.self, forHeaderFooterViewReuseIdentifier: NSStringFromClass(TopicListTableViewHeader.self))
        self.separatorColor = UIColor.clear
    }


}

extension TopicListTableView: UITableViewDataSource {

    // テーブルビューのセクションごとにデータ要素数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    // テーブルビューのセクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    // テーブルビューのセルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }

    // テーブルビューのセル生成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(TopicListCell.self), for: indexPath) as? TopicListCell else {
            return UITableViewCell()
        }

        return cell
    }
}

// セルタップ時の動作定義など
extension TopicListTableView: UITableViewDelegate {

    //テーブルビューのセクションヘッダの中身
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: NSStringFromClass(TopicListTableViewHeader.self)) as? TopicListTableViewHeader else {
            return nil
        }
        header.title = "テスト"
        return header
    }

    // テーブルビューのセクションヘッダの高さ
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    // テーブルビューのセルタップ時の挙動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

