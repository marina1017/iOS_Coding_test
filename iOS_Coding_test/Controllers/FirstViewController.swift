//
//  ViewController.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/12.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController, UICollectionViewDelegateFlowLayout{
    
    private let topicListViewModel = TopicListViewModel()

    var collectionView: UICollectionView!

    var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = Appearance.size.small
        flowLayout.minimumLineSpacing = Appearance.size.small
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: Appearance.size.medium, bottom: Appearance.size.default, right: Appearance.size.medium)
        flowLayout.headerReferenceSize = CGSize(width: 0, height: 50)
        return flowLayout
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "トピック一覧"

        // レイアウト作成
        self.flowLayout.itemSize = CGSize(width: (self.view.frame.size.width - (Appearance.size.small*2))/2 - 10, height: 100)

        //collectionView
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.flowLayout)
        self.collectionView.dataSource = topicListViewModel
        self.collectionView.delegate = self
        self.collectionView.backgroundColor = .white
        
        //セルを登録
        self.collectionView.register(TopicContentView.self, forCellWithReuseIdentifier: "cell")
        //ヘッダーを登録
        self.collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")

        self.view.addSubview(self.collectionView)

        // AutoLayout制約を追加
        setupConstraints()
        
        self.topicListViewModel.updateTopicList { () -> Void in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    

    private func setupConstraints(){
        self.collectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FirstViewController: UICollectionViewDelegate {
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

//extension FirstViewController: UICollectionViewDataSource {
//    //個数
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//
//    //セルに何を表示するか
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as UICollectionViewCell
//        cell.isSelected = false
//
//        return cell
//    }
//
//    // ヘッダー追加のため
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//
//        let headerReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath as IndexPath) as UICollectionReusableView
//
//        return headerReusableView
//    }
//
//    //セクション数の指定
//    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 30
//    }
//
//
//}
