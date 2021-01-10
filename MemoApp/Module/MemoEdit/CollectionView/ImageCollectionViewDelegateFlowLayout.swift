//
//  ImageCollectionViewDelegateFlowLayout.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/11.
//

import UIKit

class ImageCollectionViewDelegateFlowLayout: NSObject, UICollectionViewDelegateFlowLayout {
    
    // 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellHeight = collectionView.frame.height
        
        return CGSize(width: collectionViewCellHeight, height: collectionViewCellHeight)
        
    }
    
    // 위아래 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 1
        
    }
    
    // 옆 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
        
    }

}

