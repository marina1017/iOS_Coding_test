//
//  TopicListCell.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/22.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import SnapKit

class TopicListCell: UITableViewCell {

    var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = Appearance.size.small
        flowLayout.minimumLineSpacing = Appearance.size.default
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: Appearance.size.default, right: 0)
        flowLayout.headerReferenceSize = CGSize(width: 0, height: Appearance.size.extraLarge)
        return flowLayout
    }()

    var sectionHeaderView: SectionHeaderView = {
        let sectionHeaderView = SectionHeaderView()
        return sectionHeaderView
    }()

    var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        ////collectionView
        // レイアウト作成
        self.flowLayout.estimatedItemSize = CGSize(width: (self.frame.size.width/2), height: 100)
        self.flowLayout.itemSize = CGSize(width: (self.frame.size.width/2), height: 100)


        //collectionView
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.flowLayout)
        self.collectionView.backgroundColor = .white
        //セルを登録
        self.collectionView.register(TopicContentView.self, forCellWithReuseIdentifier: "cell")
        //ヘッダーを登録
        self.collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        self.addSubview(self.collectionView)

        self.collectionView.dataSource = self
        self.collectionView.delegate = self



    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutCollectionView()
        print("self.frame.size",self.frame.size)
        print("self.collectionView.frame.size",self.collectionView.frame.size)
        print("self.flowLayout.collectionViewContentSize",self.flowLayout.collectionViewContentSize)
    }

    private func layoutCollectionView() {
        self.collectionView.sizeToFit()
        self.collectionView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.width.equalToSuperview().offset(-Appearance.size.default*2)
            make.left.equalToSuperview().offset(Appearance.size.default)
            make.bottom.equalToSuperview()
        }
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
    //それぞれのコンテンツの個数
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

