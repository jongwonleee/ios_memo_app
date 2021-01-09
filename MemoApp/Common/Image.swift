//
//  Image.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/10.
//

import UIKit

enum Image {
    case sort
}

extension Image {
    var value: UIImage? {
        switch self {
        case .sort:
            return UIImage(named: "sort")
        }
    }
}
