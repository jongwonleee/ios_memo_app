//
//  MemoVIew.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/10.
//

import UIKit
import SnapKit

class MemoListView: View {
    
    let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let actionSheetSort: ActionSheetSort = ActionSheetSort()
    let dataSource: MemoCollectionViewDataSource = MemoCollectionViewDataSource()
    let flowLayout: MemoCollectionViewDelegateFlowLayout = MemoCollectionViewDelegateFlowLayout()

    override func createSubviews(_ view: UIView) {
        super.createSubviews(view)
        collectionView.dataSource = self.dataSource
        collectionView.delegate = flowLayout
        collectionView.register(MemoViewCell.self, forCellWithReuseIdentifier: MemoViewCell.identifier)
        collectionView.backgroundColor = .white
        self.addSubview(collectionView)
    }
    
    override func configureConstraints(_ guide: ConstraintLayoutGuideDSL) {
        super.configureConstraints(guide)
        collectionView.snp.makeConstraints { make in
            make.trailing.equalTo(guide.trailing).offset(-8)
            make.leading.equalTo(guide.leading).offset(8)
            make.top.equalTo(guide.top)
            make.bottom.equalTo(0)
        }
    }
}
