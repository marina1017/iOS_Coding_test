//
//  Result.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/17.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

enum Result<T, Error: Swift.Error> {
    case success(T)
    case failure(Error)

    init(value: T) {
        self = .success(value)
    }

    init(error: Error) {
        self = .failure(error)
    }

}
