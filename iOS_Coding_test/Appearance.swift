//
//  Appearance.swift
//  iOS_Coding_test
//
//  Created by nakagawa on 2018/07/13.
//  Copyright © 2018年 nakagawa. All rights reserved.
//

import UIKit

final class Appearance {
    struct Margin {
        var small: CGFloat {
            return 5
        }

        var `default`: CGFloat {
            return 10
        }

        var large: CGFloat {
            return 15
        }
    }
    struct Size {
        var small: CGFloat {
            return 10
        }

        var `default`: CGFloat {
            return 20
        }

    }
    static let margin = Appearance.Margin()
    static let size = Appearance.Size()

}
