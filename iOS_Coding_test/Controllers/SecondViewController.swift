//
//  SecondViewController.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/12.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SecondViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    var tableView: UITableView!

    var topicListCell: TopicListCell!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "フォロー済み"


        ////tableView
        self.topicListCell = TopicListCell()
        self.tableView = UITableView()
        self.tableView.frame = self.view.frame
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // セルをテーブルに紐付ける
        self.tableView.register(TopicListCell.self, forCellReuseIdentifier: NSStringFromClass(TopicListCell.self))

        //テーブルビューを触れないように
        self.tableView.allowsSelection = false

        // テーブルを表示
        self.view.addSubview(tableView)

        //collectionViewのデリゲート
//        self.topicListCell.collectionView.dataSource = self.topicListCell
//        self.topicListCell.collectionView.delegate = self.topicListCell

        // AutoLayout制約を追加
        setupConstraints()
    }

    private func setupConstraints(){
        self.tableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TopicListCell: UICollectionViewDelegate {
    //セル選択時に呼び出されるメソッド
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let topicContentView = collectionView.cellForItem(at: indexPath) as! TopicContentView
        topicContentView.isSelectedCell = topicContentView.isSelectedCell == false ? true : false
        topicContentView.setStyle()
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray // タップしているときの色にする
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = Appearance.color.background  // 元の色にする
    }
}

extension TopicListCell: UICollectionViewDataSource {
    //個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    //セルに何を表示するか
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as UICollectionViewCell
        cell.isSelected = false

        return cell
    }

    // ヘッダー追加のため
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {


        let headerReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath as IndexPath) as UICollectionReusableView

        return headerReusableView
    }

    //セクション数の指定
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

extension SecondViewController: UITableViewDataSource {

    // セクションごとにデータ要素数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    // セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    // セル生成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(TopicListCell.self), for: indexPath)

        return cell
    }
}

// セルタップ時の動作定義など
extension SecondViewController: UITableViewDelegate {

    // セクションヘッダの高さ
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    // セルタップ時の挙動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
