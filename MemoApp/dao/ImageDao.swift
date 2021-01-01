//
//  ImageDao.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/31.
//

import Foundation
import RealmSwift

class ImageDao: Object {
    @objc dynamic var memoId:Int = 0
    @objc dynamic var no:Int = 0
    @objc dynamic var data:Data = Data()
}
