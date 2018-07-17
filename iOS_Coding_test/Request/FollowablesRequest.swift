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
        return URL(string: "https://api.myjson.com")!
        //return URL(string: "https://deeplink.dev.n8s.jp")!
    }

    //GitHubRequestプロトコルに準拠する型をURLRequest型の値に変換する
    func buildURLRequest() -> URLRequest {
        //baseURLとpathを結合
        let url = baseURL.appendingPathComponent(path)
        //URLComponents型URL型の構成要素を表現する
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)

        switch method {
        case .get:
            let dictionary = parameters as? [String: Any]
            //パラメーターがあれば[URLQueryItem]型に変換して返す
            //適切なエンコードを施したクエリ文字列を生成できる
            let queryItems = dictionary?.map{ key, value in
                return URLQueryItem(
                    name: key,
                    value: String(describing: value))
            }
            components?.queryItems = queryItems
        default:
            fatalError("Unsupported method \(method)")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        //rawValueとは？　あとで調べる
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
    //URLSessionクラスを通じてサーバーから受け取ったData型とHTTPURLResponse型の値をもとにレスポンスの型を表す連想型Responseの値を生成
    func response(from data: Data, urlResponse: URLResponse) throws -> Response {
        //取得したデータをAny型へ変換 Data型→Any型→Response型に変換されていく
        //ここで変換できない場合このクラスメソッドでエラーが発生する
        let json = try JSONSerialization.jsonObject(with: data, options: [])

        //HTTPURLResponse型を確認することでサーバーから受け取った値をどのように解釈すべきかわかる
        //HTTPステータスコードに応じて処理を分岐する
        if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
            // JSONからモデルをインスタンス化
            return try Response(json:json)
        } else {
            //JSONからAPIエラーをインスタンス化
            return try APIError(json:json) as! Self.Response
        }
    }
}
