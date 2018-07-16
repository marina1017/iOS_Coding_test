//
//  JSONDecodeError.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/16.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

enum JSONDecodeError : Error {
    //JSONの構造が期待しているものを異なっている
    case invalidFormat(json: Any)
    //構造体の初期化に必要なキーに対する値がJSONに存在していない
    case missingValue(key: String, actualValue: Any?)
}
