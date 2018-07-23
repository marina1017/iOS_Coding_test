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

    private let topicListViewModel = TopicListViewModel()

    var tableView: TopicListTableView = {
        let tableView = TopicListTableView(frame: CGRect.zero, style: .grouped)
        //テーブルビューを触れないように
        tableView.allowsSelection = false
        return tableView

    }()

    var topicListCell: TopicListCell = {
        let topicListCell = TopicListCell()
        return topicListCell
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
        self.navigationItem.title = "フォロー済み"

        self.tableView.frame = self.view.frame
        // テーブルを表示
        self.view.addSubview(tableView)

        // AutoLayout制約を追加
        setupConstraints()
    }

    private func setupConstraints(){
        self.tableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
