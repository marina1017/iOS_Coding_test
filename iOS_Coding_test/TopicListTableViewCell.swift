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

class TopicListTableViewCell: UITableViewCell {

    var collectionView: UICollectionView?

    var cellContentView: VerticalStacView = {
        let stackView = VerticalStacView(frame: CGRect.zero)
        stackView.axis = .vertical
        stackView.spacing = Appearance.margin.small
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
            make.top.equalToSuperview().offset(Appearance.margin.large)
            make.left.equalToSuperview().offset(Appearance.margin.large)
            make.right.equalToSuperview().offset(-Appearance.margin.large)
            make.bottom.equalToSuperview().offset(-Appearance.margin.large)
        }
//        let collectionView = UICollectionView()
//        self.collectionView = collectionView
//        self.collectionView?.delegate = self
//        self.collectionView?.dataSource = self
//        self.addSubview(self.collectionView!)
//        self.collectionView?.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(Appearance.margin.large)
//            make.left.equalToSuperview().offset(Appearance.margin.large)
//            make.right.equalToSuperview().offset(-Appearance.margin.large)
//            make.bottom.equalToSuperview().offset(-Appearance.margin.large)
//        }
//        self.collectionView?.register(TestCell.self, forCellWithReuseIdentifier: NSStringFromClass(TestCell.self))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TopicListTableViewCell: UICollectionViewDelegate {
    
}

//extension TopicListTableViewCell: UICollectionViewDataSource {
//    //データの個数を返すメソッド
//    func colectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 7
//    }
//
//    //データを返すメソッド
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(TestCell.self), for: indexPath)
//
//        //背景色指定
//        cell.backgroundColor = UIColor.red
//
//        return cell
//    }
//
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
//    {
//        return CGSize(width: 50, height: 50)
//    }
//
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
//    {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
//
//}
//
//class TestCell: UICollectionViewCell {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = UIColor.green
//        self.prepareForReuse()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
