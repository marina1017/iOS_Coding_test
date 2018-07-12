//
//  ViewController.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/12.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.tableView = UITableView()
        self.tableView.frame = self.view.frame
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // セルをテーブルに紐付ける
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //テーブルビューを触れないように
        tableView.allowsSelection = false
        
        // テーブルを表示
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension FirstViewController: UITableViewDataSource {
    
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
        return 100
    }
    
    // セル生成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        return cell
    }
}

// セルタップ時の動作定義など
extension FirstViewController: UITableViewDelegate {
    
    // セクションヘッダの高さ
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // セルタップ時の挙動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

