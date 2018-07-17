//
//  hit.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/16.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

struct Contents: JSONDecodable {
    let id: String
    let label: String
    let type: String
    let followersCount: Int

    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        print("dictionary:",dictionary)
        guard let id = dictionary["id"] as? String else {
            throw JSONDecodeError.missingValue(key: "id", actualValue: dictionary["id"])
        }

        guard let label = dictionary["label"] as? String else {
            throw JSONDecodeError.missingValue(key: "label", actualValue: dictionary["label"])
        }

        guard let type = dictionary["type"] as? String else {
            throw JSONDecodeError.missingValue(key: "type", actualValue: dictionary["type"])
        }

        guard let followersCount = dictionary["followers_count"] as? Int else {
            throw JSONDecodeError.missingValue(key: "followers_count", actualValue: dictionary["followers_count"])
        }

        self.id = id
        self.label = label
        self.type = type
        self.followersCount = followersCount
    }
}
