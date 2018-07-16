//
//  SearchResponse.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/16.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

struct SearchResponse<Sections :JSONDecodable> :JSONDecodable {
    let sections: [Sections]

    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }

        guard let sectionsObject = dictionary["sections"] as? [Any] else {
            throw JSONDecodeError.missingValue(key: "sections", actualValue: dictionary["sections"])
        }

        let sections = try sectionsObject.map {
            return try Sections(json: $0)
        }

        self.sections = sections
    }
}
