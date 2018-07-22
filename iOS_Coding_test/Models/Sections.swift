//
//  followablesModel.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/16.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Sections: JSONDecodable {
    let title: String
    let groups: [Groups]

    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }

        guard let title = dictionary["title"] as? String else {
            throw JSONDecodeError.missingValue(key: "title", actualValue: dictionary["title"])
        }

        guard let groupsObject = dictionary["groups"] as? [Any] else {
            throw JSONDecodeError.missingValue(key: "groups", actualValue: dictionary["groups"])
        }
        let groups = try groupsObject.map {
            return try Groups(json: $0)
        }

        self.title = title
        self.groups = groups
    }

}
