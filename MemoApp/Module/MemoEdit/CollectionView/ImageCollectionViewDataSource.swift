//
//  ImageCollectionViewDataSource.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/11.
//

import UIKit

class ImageCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var images: [ImageDao] = [ImageDao]()
    
    public func loadMemo() {
        self.images = RealmManager.shared.getImage()?.toArray() ?? [ImageDao]()
    }
    
    override init() {
        super.init()
        loadMemo()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 이미지 카운터 하는 함수
        return images.count
        
    }
    
    // 셀 구성하기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageViewCell.identifier, for: indexPath) as? ImageViewCell else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: ImageViewCell.identifier, for: indexPath)
        }
        
        cell.imageView.image = images[indexPath.row].image
        return cell
        
    }
}
