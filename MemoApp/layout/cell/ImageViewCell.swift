//
//  ImageViewCell.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/29.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    public var imageView:UIImageView = UIImageView()
    public var eraseButton:UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(imageView)
        //self.contentView.addSubview(eraseButton)
        
        imageView.backgroundColor = .systemBlue
        imageView.layer.cornerRadius = 20.0
        imageView.layer.masksToBounds = true
        imageView.snp.makeConstraints{ make in
            make.top.equalTo(8)
            make.bottom.equalTo(-8)
            make.trailing.equalTo(-8)
            make.leading.equalTo(8)
        }
        
//        eraseButton.backgroundColor = .systemPink
//        eraseButton.snp.makeConstraints{make in
//            make.top.equalTo(2)
//            make.trailing.equalTo(-2)
//            make.width.equalTo(20)
//            make.height.equalTo(20)
//        }
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
}
