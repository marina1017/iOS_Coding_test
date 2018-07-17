//
//  followablesAPI.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/17.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import Foundation

final class FollowablesAPI {
    struct SearchRespositories: FollowablesRequest {
        let keyword : String
        // GitHubRequestが要求する連想型
        typealias Response = SearchResponse<Sections>

        var method: HTTPMethod {
            return .get
        }

        var path: String {
            return "/bins/156ww6"
            //return "/quiz/followables.json"
        }

        var parameters: Any? {
            return ["q": keyword]
        }
    }
}
