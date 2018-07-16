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

class SecondViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource  {

    var collectionView:UICollectionView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // レイアウト作成
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = Appearance.size.small
        flowLayout.minimumLineSpacing = Appearance.size.small
        flowLayout.itemSize = CGSize(width: (self.view.frame.size.width - (Appearance.size.small*2))/2 - 10, height: 100)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: Appearance.size.default, right: 0)
        flowLayout.headerReferenceSize = CGSize(width: 0, height: 50)

        // コレクションビュー作成
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")  // 2.ヘッダー追加のため
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)

        // AutoLayout制約を追加
        setupConstraints()
    }

    private func setupConstraints(){

        // コレクションビューの制約

        self.collectionView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(Appearance.size.medium)
            make.right.equalToSuperview().offset(-Appearance.size.medium)
            make.bottom.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    //セルに何を表示するか
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.red
        return cell
    }

    // ヘッダー追加のため
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {


        let headerReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath as IndexPath) as UICollectionReusableView

        return headerReusableView
    }

    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 30
    }

}
