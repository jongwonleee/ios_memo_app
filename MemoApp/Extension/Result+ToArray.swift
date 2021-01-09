//
//  Result+ToArray.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/10.
//

import RealmSwift

extension Results {
    func toArray() -> [Element] {
      return compactMap {
        $0
      }
    }
 }


