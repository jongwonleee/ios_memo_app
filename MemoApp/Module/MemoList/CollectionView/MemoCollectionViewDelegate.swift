//
//  MemoCollectionViewDelegate.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/10.
//

import UIKit

class MemoCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    var cellDidClick: ((Int) -> Void)?

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        guard let onClick = cellDidClick else { return }
        onClick(indexPath.row)
    }
}
