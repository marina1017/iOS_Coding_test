//
//  WebAPI.swift
//  iOS_Coding_test
//
//  Created by 中川万莉奈 on 2018/07/19.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation
import Alamofire

class WebApi {
    class func getJsonObject(url: String, complated: @escaping ((AnyObject?) -> Void)) -> () {
        //Automatic Validationをしてくれる関数validate() 200 .. <300の範囲内のステータスコードを自動的に検証
        Alamofire.request(url).validate().responseJSON{ response in
            //エラーハンドリング
            guard  response.error == nil else {
                return
            }
            //データハンドル
            guard response.result.value != nil else {
                return
            }
            switch response.result {
            case .success(let value):
                complated(value as AnyObject)
                return
            case .failure(let error):
                print(error)
                return
            }
        }
    }
}
