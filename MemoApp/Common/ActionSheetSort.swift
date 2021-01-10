//
//  ActionSheetSort.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/11.
//

import UIKit

@objc
protocol ActionSheetSortDelegate: class {
    func titleDidTap(_ sender: UIAlertAction)
    func createdDateDidTap(_ sender: UIAlertAction)
    func editDateDidTap(_ sender: UIAlertAction)
}

class ActionSheetSort:UIAlertController {
    weak var delegate: ActionSheetSortDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    private func configure() {
        self.title = "정렬 방식"
        self.message = "선택한 방식으로 메모들이 정렬됩니다."
        self.addAction(UIAlertAction(title: "제목", style: .default, handler: delegate?.titleDidTap(_:)))
        self.addAction(UIAlertAction(title: "생성일", style: .default, handler: delegate?.createdDateDidTap(_:)))
        self.addAction(UIAlertAction(title: "수정일", style: .default, handler: delegate?.editDateDidTap(_:)))
        self.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
    }
    
}
