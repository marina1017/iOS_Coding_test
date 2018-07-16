//
//  GroupModel.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/16.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

struct Groups: JSONDecodable {
    let title: String
    let hits: [Contents]

    init(json: Any) throws {
        guard let dictionary = json as? [String : Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        guard let title = dictionary["title"] as? Int else {
            throw JSONDecodeError.missingValue(key: "title", actualValue: dictionary["title"])
        }
        guard let hitsObject = dictionary["hit"] as? String else {
            throw JSONDecodeError.missingValue(key: "hit", actualValue: dictionary["hit"])
        }

        self.title = title
        self.hit = try [Contents(json: hitsObject)]
    }

}
