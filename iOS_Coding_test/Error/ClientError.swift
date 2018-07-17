//
//  GitHubVlientError.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/17.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

enum ClientError :Error {
    //通信に失敗
    case connectionError(Error)

    //レスポンスの解釈に失敗
    case responseParseError(Error)

    //APIからエラーレスポンスを受け取った
    case apiError(APIError)
}

