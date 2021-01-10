//
//  MemoVIew.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/10.
//

import UIKit
import SnapKit

class MemoView: View {
    
    let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    lazy var actionSheetSort: UIAlertController = {
        let action: UIAlertController = UIAlertController(title: "정렬 방식", message: "선택한 방식으로 메모들이 정렬됩니다.", preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "제목", style: .default, handler: { (action) in
            self.dataSource.sort(.title)
            self.collectionView.reloadData()
        }))
        action.addAction(UIAlertAction(title: "생성일", style: .default, handler: { (action) in
            self.dataSource.sort(.createdDate)
            self.collectionView.reloadData()
            
        }))
        action.addAction(UIAlertAction(title: "수정일", style: .default, handler: { (action) in
            self.dataSource.sort(.updatedDate)
            self.collectionView.reloadData()
            
        }))
        action.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        return action
    }()
    
    let dataSource: MemoCollectionViewDataSource = MemoCollectionViewDataSource()
    let flowLayout: MemoCollectionViewDelegateFlowLayout = MemoCollectionViewDelegateFlowLayout()

    override func createSubviews(_ view: UIView) {
        collectionView.dataSource = self.dataSource
        collectionView.delegate = flowLayout
        collectionView.register(MemoViewCell.self, forCellWithReuseIdentifier: MemoViewCell.identifier)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    override func configureConstraints(_ guide: ConstraintLayoutGuideDSL) {
        collectionView.snp.makeConstraints { make in
            make.trailing.equalTo(guide.trailing).offset(-8)
            make.leading.equalTo(guide.leading).offset(8)
            make.top.equalTo(guide.top)
            make.bottom.equalTo(0)
        }
    }
}
