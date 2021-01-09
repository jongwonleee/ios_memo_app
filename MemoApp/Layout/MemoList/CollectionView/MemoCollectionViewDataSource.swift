//
//  MemoDataSource.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/10.
//

import UIKit

class MemoCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    enum SortType {
        case title
        case updatedDate
        case createdDate
    }
    
    public func sort(_ type: SortType){
        switch type {
        case .createdDate:
            self.memo.sort { $0.createdDate > $1.createdDate }
            break
        case .title:
            self.memo.sort { $0.title > $1.title }
            break
        case .updatedDate:
            self.memo.sort { $0.updatedDate > $1.updatedDate }
            break
        }
    }
    
    var memo:[MemoDao] = [MemoDao]()
    
    public func loadMemo(){
        memo = RealmManager.shared.getMemo()?.toArray() ?? [MemoDao]()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as? MemoViewCell else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath)
        }
        cell.setCellView(memo[indexPath.row])

        return cell
    }
}
