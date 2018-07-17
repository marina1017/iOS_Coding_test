//
//  FollowablesAPIClient.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/17.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

class FollowablesAPIClient {

    private let session: URLSession = {
        let configration = URLSessionConfiguration.default
        let session = URLSession(configuration: configration)
        return session
    }()

    func send<Request: FollowablesRequest>(request: Request, completion: @escaping (Result<Request.Response, ClientError>) -> Void) {
        //URLRequest型のインスタンスを生成
        let urlRequest = request.buildURLRequest()

        //URLSession型のインスタンスに渡して
        let task = session.dataTask(with: urlRequest) { data, response, error in

            switch (data, response, error) {
            case (_, _, let error?):
                //HTTPステータスコードが200番台
                completion(Result(error: .connectionError(error)))

            case (let data?, let response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    completion(Result(value: response))

                //200番台以外のエラー
                } catch let error as APIError {
                    //エラーレスポンスを受け取った状況を示す
                    completion(Result(error: .apiError(error)))
                } catch {
                    //レスポンスが想定通りの構成をしていなかった時
                    completion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("invalid response combination \(data), \(response),\(error).")
            }

        }

        //HTTPリクエスト送信
        task.resume()

    }
}
