//
//  Request.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/17.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

protocol FollowablesRequest {
    //レスポンスの方をリクエストの方に紐づけて、リクエストの方からレスポンスの型を決定できるようにする
    associatedtype Response: JSONDecodable

    //共通部分を切り出す
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    //今回パラメーターは無いけど一応用意Any?なのはパラメーターが必ずしも必要というわけではないから
    var parameters: Any? { get }
}

extension FollowablesRequest {
    var baseURL: URL {
        return URL(string: "https://deeplink.dev.n8s.jp")!
}
