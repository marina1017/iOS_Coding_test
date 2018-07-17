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
        //guard let dictionary = json as? [String : Any] else {
            //self.title = ""
            throw JSONDecodeError.invalidFormat(json: json)
        }

        guard let title = dictionary["title"] as? String else {
            throw JSONDecodeError.missingValue(key: "title", actualValue: dictionary["title"])
        }

        guard let hitsObject = dictionary["hits"] as? [Any] else {
            throw JSONDecodeError.missingValue(key: "hits", actualValue: dictionary["hits"])
        }
        let hits = try hitsObject.map {
            return try Contents(json: $0)
        }

        self.title = title
        self.hits = hits
    }

}
