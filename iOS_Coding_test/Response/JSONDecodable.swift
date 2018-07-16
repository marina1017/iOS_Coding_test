//
//  JSONDecodable.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/16.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init(json: Any) throws
}
