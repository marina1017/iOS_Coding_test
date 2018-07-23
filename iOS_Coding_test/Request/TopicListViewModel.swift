//
//  TopicListViewModel.swift
//  iOS_Coding_test
//
//  Created by 中川万莉奈 on 2018/07/19.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class TopicListViewModel: NSObject, UICollectionViewDataSource  {
    
//    var sectionTitle: String
//    var contentTitle: String?
    //var sections : [Sections] = []
    //var groups: [Groups] = []
    
    var titleLists: [[String: String?]] = []
    var contents: [Contents] = []
    
    
    
    override init() {
        super.init()
    }
    
    func updateTopicList(complated: @escaping () -> Void) {
        WebApi.getJsonObject(url: "https://deeplink.dev.n8s.jp/quiz/followables.json", complated: { (jsonObject: AnyObject?) -> Void in
            let json = JSON(jsonObject)
            self.titleLists.removeAll(keepingCapacity: false)
            json["sections"].forEach { (number, json) in
                let title = json["title"].string
                print(title) // foo or bar
                var dic: [String: String?] = [:]
                dic["sectionTitle"] = json["title"].string
                dic["contentTitle"] = json["groups"][0]["title"].string
                self.titleLists.append(dic)
            }
            complated()
        })
    }
    
    //個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    //セルに何を表示するか
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as? TopicContentView else {
            return UICollectionViewCell()
        }
        cell.topicTitleLabel.text = self.titleLists[indexPath.row]["title"] as? String
        cell.isSelected = false
        
        return cell
    }
    
    // ヘッダー追加のため
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        guard let headerReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath as IndexPath) as? SectionHeaderView else {
            return UICollectionReusableView()
        }
        //headerReusableView.sectionTitleLabel.text = self.titleLists[indexPath.section]["sectionTitle"] as? String
        headerReusableView.titleLabel.text = self.titleLists[indexPath.section]["contentTitle"] as? String

        
        return headerReusableView
    }
    
    //セクション数の指定
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.titleLists.count ?? 0
    }


}

extension TopicListViewModel: UITableViewDataSource {
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
        return 400
    }

    // セル生成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(TopicListCell.self), for: indexPath) as? TopicListCell else {
            return UITableViewCell()
        }

        //cell.sectionTitleLabel.text = self.titleLists[indexPath.row]["sectionTitle"] as? String

        return cell
    }
}
