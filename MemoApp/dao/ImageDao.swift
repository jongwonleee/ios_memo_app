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
    @objc dynamic var url:String = ""
//    @objc dynamic var compoundKey:String = ""
    var image:UIImage? {
        return UIImage(data: self.data)
    }
    
//    override static func primaryKey() -> String? {
//        return "compoundKey"
//    }
}
