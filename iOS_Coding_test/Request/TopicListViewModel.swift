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
    
    func updateTopicList() {
        WebApi.getJsonObject(url: "https://deeplink.dev.n8s.jp/quiz/followables.json", complated: { (jsonObject: AnyObject?) -> Void in
            let json = JSON(jsonObject)
            self.titleLists.removeAll(keepingCapacity: false)
            json["sections"].forEach { (number, json) in
                let title = json["title"].string
                print(title) // foo or bar
                var dic: [String: String?] = [:]
                dic["sectionTitle"] = json["title"].string
                dic["contentTitle"] = json["groups"]["title"].string
                self.titleLists.append(dic)
            }
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
        
        
        let headerReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath as IndexPath) as UICollectionReusableView
        
        return headerReusableView
    }
    
    //セクション数の指定
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.titleLists.count ?? 0
    }


}
