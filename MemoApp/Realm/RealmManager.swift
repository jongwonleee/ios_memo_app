//
//  RealmManager.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/10.
//

import Foundation
import RealmSwift

protocol DatabaseProviding {
    func addMemo(_ memo: MemoDao)
    func updateMemo(_ memo: [MemoDao])
    func getMemo() -> Results<MemoDao>?
}

class RealmManager: DatabaseProviding {
    func addMemo(_ memo: MemoDao) {
        try? realm?.write{
            realm?.add(memo)
        }
    }
    
    func updateMemo(_ memo: [MemoDao]) {
        try? realm?.write{
            realm?.add(memo, update: .modified)
        }

    }
    
    func getMemo() -> Results<MemoDao>? {
        try? realm?.objects(MemoDao.self)
    }
    

    public static let shared = RealmManager()

    let realm: Realm?
    
    private init() {
        realm = try? Realm()
    }
    
    var newId: Int {
        if let ret = realm?.objects(MemoDao.self).sorted(byKeyPath: "id").last?.id {
            return ret + 1
        } else {
            return 0
        }
    }
}
