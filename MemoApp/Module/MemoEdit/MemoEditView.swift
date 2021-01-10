//
//  MemoView.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/11.
//

import UIKit
import SnapKit

class MemoEditView: View {
    
    let picker = UIImagePickerController()
    
    let actionSheet: UIAlertController = {
        let action: UIAlertController = UIAlertController(title: "이미지 불러오기", message: "이미지를 불러올 방법을 선택하세요", preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "앨범", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//                self.picker.sourceType = .photoLibrary
//                self.present(self.picker, animated: false, completion: nil)
            } else {
                print("photo library not available")
            }
            
        }))
        action.addAction(UIAlertAction(title: "카메라", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
//                self.picker.sourceType = .camera
//                self.present(self.picker, animated: false, completion: nil)
            } else {
                print("camera not available")
            }
        }))
        action.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        return action
    }()
    
    let textView: UITextView = {
        let textView: UITextView = UITextView()
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.isScrollEnabled = true
        textView.isUserInteractionEnabled = true
        return textView
    }()
    
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        return collectionView
    }()
    
    let view: UIView = UIView()
    
    let delegate:ImageCollectionViewDelegateFlowLayout = ImageCollectionViewDelegateFlowLayout()
    let dataSource: ImageCollectionViewDataSource = ImageCollectionViewDataSource()
    
    override func createSubviews(_ view: UIView) {
        super.createSubviews(view)
        
        self.addSubview(textView)
        self.addSubview(collectionView)
        self.addSubview(self.view)
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.register(ImageViewCell.self, forCellWithReuseIdentifier: ImageViewCell.identifier)
        
        self.view.backgroundColor = collectionView.backgroundColor
        
    }
    
    override func configureConstraints(_ guide: ConstraintLayoutGuideDSL) {
        super.configureConstraints(guide)
        textView.snp.makeConstraints { make in
            make.leading.equalTo(guide.leading)
            make.top.equalTo(guide.top)
            make.trailing.equalTo(guide.trailing)
            make.bottom.equalTo(0)
        }
        
        collectionView.snp.makeConstraints { make in
            make.bottom.equalTo(guide.bottomMargin)
            make.leading.equalTo(guide.leading)
            make.trailing.equalTo(guide.trailing)
            make.height.equalTo(100)
        }
        
        view.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.bottom.equalTo(0)
        }
        
    }
}
