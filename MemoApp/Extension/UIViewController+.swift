//
//  UIViewController+.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/10.
//

import UIKit
import RealmSwift

extension UIViewController {
    var realm:Realm {
        try! Realm()
    }
    
    var newId:Int {
        if let ret = realm.objects(MemoDao.self).sorted(byKeyPath: "id").last?.id
        {
            return ret + 1
        }else
        {
            return 0
        }
    }
}
