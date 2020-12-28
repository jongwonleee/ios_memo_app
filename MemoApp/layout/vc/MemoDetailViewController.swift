//
//  MemoDetailViewController.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/23.
//

import Foundation
import UIKit
import SnapKit

class MemoDetailViewController: UIViewController {
    
    public var memoId:Int
    {
        get{self.memoId}
        
        //TODO 나중에 숫자가 아니라 dao로 변경하기
        set(newVal){
            navigationItem.title = "\(newVal)"
        }
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
    }
}
