//
//  MemoDao.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/31.
//

import Foundation
import RealmSwift

class MemoDao: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var createdDate: Date = Date()
    @objc dynamic var updatedDate: Date = Date()
    @objc dynamic var title: String = ""
    @objc dynamic var content: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
